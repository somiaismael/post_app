import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/post.dart';
import '../repositorise/post_repositories.dart';

class UpdatePost {
  UpdatePost({required this.repositories});
  final PostRepositories repositories;

 Future<Either<Failure , Unit>> call(Post post) async{
  return await repositories.updatePosts(post);
  }
}