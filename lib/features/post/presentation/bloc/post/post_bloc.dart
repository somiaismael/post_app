import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/usecases/get_posts.dart';
import 'package:dartz/dartz.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;
  PostBloc({required this.getPosts}) : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(LoadingPotsState());
        final getPostsOrFailure = await getPosts.call();
       emit( _getAllpostsOrFailure(getPostsOrFailure));

      } else if (event is RefreshPostsEvent) {
        emit(LoadingPotsState());
        final getPostsOrFailure = await getPosts.call();
          emit( _getAllpostsOrFailure(getPostsOrFailure));
      }
    });
  }

  PostState _getAllpostsOrFailure(Either<Failure, List<Post>> either) {
    return either.fold(
      (failure) => ErroPostsState(message: _failureMessage(failure)),
      (posts) => LoadedPostsState(posts: posts),
    );
  }

  String _failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyChacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Not Expected Erro, try again later";
    }
  }
}
