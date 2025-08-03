import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/post.dart';
import '../repositorise/post_repositories.dart';

class GetPosts {
  GetPosts({required this.postRepositories});
  final PostRepositories postRepositories;

  Future<Either< Failure , List<Post>>>  call() async{
  return   postRepositories.getPosts() ;



  }

}