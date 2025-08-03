import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/post/post_bloc.dart';
import 'post_add_update_page.dart';
import '../widget/post_page/display_erro_message.dart';
import '../widget/post_page/posts_list.dart';

class PostPages extends StatelessWidget {
  const PostPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: _appBarWidget(),
       floatingActionButton: _floatingActionButton(() =>Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PostAddUpdatePage(isUpdatePost: false),
        ),
      ) ,),
      body: BodyWidget(),
    );
  }
 
 AppBar  _appBarWidget() => AppBar(title: Text("Posts",
 style: TextStyle(color: Colors.white),),);

Widget _floatingActionButton( Function() onPressed) {
  return FloatingActionButton(
    onPressed: onPressed,
    child: const Icon(Icons.add, color: Colors.white),
  );
}


}


class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
    child: BlocBuilder<PostBloc,PostState>(builder: (context,state){
      if(state is LoadingPotsState){
        return LoadingWidget();
      }else if(state is LoadedPostsState){
        return PostsList(posts: state.posts,);
      }else if(state is ErroPostsState){
        return DisplayErroMessage(message: state.message,);
      }else{
             return LoadingWidget();
      }
    }),);
  }
}
