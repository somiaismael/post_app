part of 'add_delet_update_posts_bloc.dart';

sealed class AddDeletUpdatePostsState extends Equatable {
  const AddDeletUpdatePostsState();
  
  @override
  List<Object> get props => [];
}

final class AddDeletUpdatePostsInitial extends AddDeletUpdatePostsState {}

class LoadingAddDeletUpdatePostsState extends AddDeletUpdatePostsState{}

class FailureAddDeletUpdatePostsState extends AddDeletUpdatePostsState{
   const FailureAddDeletUpdatePostsState({required this.message});
  final String message;

        @override
    List<Object> get props => [message];
}

class SuccessAddDeletUpdatePostsState extends AddDeletUpdatePostsState{
  
 const  SuccessAddDeletUpdatePostsState({required this.message});
  final String message;
       @override
    List<Object> get props => [message];

}

