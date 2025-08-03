import 'package:flutter/material.dart';
import '../../../domain/entities/post.dart';
import '../../pages/post_detail_page.dart';

class PostsList extends StatelessWidget {

  const PostsList({super.key, required this.posts});
  final List<Post> posts;
  @override
  Widget build(BuildContext context) {
  return ListView.separated(
      itemCount: posts.length,

      itemBuilder: (context, index) {
      return  ListTile(
          leading: Text("${posts[index].id}"),
          title:  Text(posts[index].title),
          subtitle:  Text(posts[index].body),
          onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PostDetailPage(post: posts[index],),
        ),
      ) ,
          );
     
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}