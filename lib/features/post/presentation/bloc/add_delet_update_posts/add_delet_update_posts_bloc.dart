import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../../core/strings/messages.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/usecases/add_post.dart';
import '../../../domain/usecases/delet_post.dart';
import '../../../domain/usecases/update_post.dart';

part 'add_delet_update_posts_event.dart';
part 'add_delet_update_posts_state.dart';

class AddDeletUpdatePostsBloc extends Bloc<AddDeletUpdatePostsEvent, AddDeletUpdatePostsState> {
 final AddPost addPost;
 final DeletPost deletPost;
 final UpdatePost updatePost;
 
  AddDeletUpdatePostsBloc({required this.addPost,required this.deletPost,required this.updatePost}) : super(AddDeletUpdatePostsInitial()) {
    on<AddDeletUpdatePostsEvent>((event, emit) async{
      if(event is AddPostEvent){
      emit(LoadingAddDeletUpdatePostsState());
      final addPostOrfailure=await addPost(event.post);

      emit(_addOrDeletOrUpdate(addPostOrfailure, ADD_SUCCESS_MESSAGE));
  
      }else if(event is UpdatePostEvent){
      emit(LoadingAddDeletUpdatePostsState());
      final UpdatePostOrfailure=await updatePost(event.post);

      emit(_addOrDeletOrUpdate(UpdatePostOrfailure, ADD_SUCCESS_MESSAGE));
      }else if(event is DeletPostEvent){
         emit(LoadingAddDeletUpdatePostsState());
      final deletPostOrfailure=await deletPost(event.id);

      emit(_addOrDeletOrUpdate(deletPostOrfailure, ADD_SUCCESS_MESSAGE));

      }
    });
  }

  AddDeletUpdatePostsState _addOrDeletOrUpdate(Either<Failure, Unit> either ,String message){
           return   either.fold(
            (failure)=>FailureAddDeletUpdatePostsState(message: _failureMessage(failure)),
              (_)=>SuccessAddDeletUpdatePostsState(message: message));
  }

  String _failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Not Expected Erro, try again later";
    }}
}
