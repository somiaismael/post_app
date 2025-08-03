import 'package:equatable/equatable.dart';

class Post extends Equatable{

  Post({this.id,required this.title,required this.body});
  final int? id;
  final String title;
   final String body; 



  @override
  List<Object?> get props => throw [id,title,body];
}