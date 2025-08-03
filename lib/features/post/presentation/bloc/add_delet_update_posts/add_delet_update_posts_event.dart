part of 'add_delet_update_posts_bloc.dart';

sealed class AddDeletUpdatePostsEvent extends Equatable {
  const AddDeletUpdatePostsEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends AddDeletUpdatePostsEvent{
  
  const  AddPostEvent({required this.post});
  final Post post;

@override
    List<Object> get props => [post];

}

class UpdatePostEvent extends AddDeletUpdatePostsEvent{
    const UpdatePostEvent({required this.post});
  final Post post;
  @override
    List<Object> get props => [post];

}

class DeletPostEvent extends AddDeletUpdatePostsEvent{
  const  DeletPostEvent({required this.id});
  final int id;
    @override
      List<Object> get props => [id];

}


