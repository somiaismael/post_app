import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String sharedprefKeyForCashedPosts = "cached_posts";

abstract class LocalDataSource {
  Future<List<PostModel>> getCashedPosts();
  Future<Unit> cashePosts(List<PostModel> postModel);
}

class LocalDataSourceImp extends LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImp({required this.sharedPreferences});
  @override
  Future<Unit> cashePosts(List<PostModel> postModel) {
    final postModeltojson =
        postModel
            .map<Map<String, dynamic>>((postModel) => postModel.tojson())
            .toList();
    sharedPreferences.setString(
      sharedprefKeyForCashedPosts,
      jsonEncode(postModeltojson),
    );
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCashedPosts() {
    final jsonString = sharedPreferences.getString(sharedprefKeyForCashedPosts);
    if (jsonString != null) {
      final decodeJsonData = jsonDecode(jsonString);
      final jsonToPostModel =
          decodeJsonData
              .map<List<PostModel>>(
                (jsonpostmodel) => PostModel.fromjson(jsonpostmodel),
              )
              .toList();
              return Future.value(jsonToPostModel);
    } else {
      throw EmptyChacheException();
    }
  }
}
