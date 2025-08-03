import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

}

class ServerFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class OfflineFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class EmptyChacheFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}