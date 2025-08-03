import '../../domain/entities/post.dart';

class PostModel extends Post {
  PostModel({required super.id,required super.title, required super.body});

  factory PostModel.fromjson(Map<String , dynamic> json){
    return PostModel(id: json["id"],title: json["title"], body: json["body"]);
  }


   Map<String , dynamic>  tojson(){
    return {"id" :id ,"title" :title ,"body" :body };
  }


}