import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../models/post_model.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositorise/post_repositories.dart';

class PostRepositoriesImp implements PostRepositories {
  PostRepositoriesImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final PostRemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    if (await networkInfo.isConected) {
      try {
        final List<PostModel> getPosts = await remoteDataSource.getAllPosts();
        localDataSource.cashePosts(getPosts);
        return right(getPosts);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addPosts(Post post) async {
    final postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );
    return await _getMessage(() => remoteDataSource.addPost(postModel));
  }

  @override
  Future<Either<Failure, Unit>> deletPosts(int id) async {
    return await _getMessage(() => remoteDataSource.deletePost(id));
  }

  @override
  Future<Either<Failure, Unit>> updatePosts(Post post) async {
    final postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );
    return await _getMessage(() => remoteDataSource.updatePost(postModel));
  }


  Future<Either<Failure, Unit>> _getMessage(
    Future Function() deletOrupdatrOradd,
  ) async {
    if (await networkInfo.isConected) {
      try {
        deletOrupdatrOradd();
        return right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
