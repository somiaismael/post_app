import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/post.dart';

abstract class PostRepositories {
  Future<Either<Failure, List<Post>>> getPosts();
  Future<Either<Failure, Unit>> addPosts(Post post);
  Future<Either<Failure, Unit>> deletPosts(int id);
  Future<Either<Failure, Unit>> updatePosts(Post post);
}
