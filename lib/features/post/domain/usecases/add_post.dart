import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/post.dart';
import '../repositorise/post_repositories.dart';

class AddPost {
  AddPost({required this.repositories});
  final PostRepositories repositories;

 Future<Either<Failure ,Unit>> call(Post post) async{
    return await repositories.addPosts(post);
  }
}