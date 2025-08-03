import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositorise/post_repositories.dart';

class DeletPost {
  DeletPost({required this.repositories});
  final PostRepositories repositories;

 Future<Either<Failure , Unit>> call(int id) async{
  return await repositories.deletPosts(id);
  }
}