part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

class LoadingPotsState extends PostState {}

class LoadedPostsState extends PostState {
  const LoadedPostsState({required this.posts});
  final List<Post> posts;
  @override
  List<Object> get props => [posts];
}

class ErroPostsState extends PostState {
  const ErroPostsState({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}