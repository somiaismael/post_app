import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../core/network/network_info.dart';
import '../features/post/data/data_sources/local_data_source.dart';
import '../features/post/data/data_sources/remote_data_source.dart';
import '../features/post/data/repositories/post_repositories_imp.dart';
import '../features/post/domain/repositorise/post_repositories.dart';
import '../features/post/domain/usecases/add_post.dart';
import '../features/post/domain/usecases/delet_post.dart';
import '../features/post/domain/usecases/get_posts.dart';
import '../features/post/domain/usecases/update_post.dart';
import '../features/post/presentation/bloc/add_delet_update_posts/add_delet_update_posts_bloc.dart';
import '../features/post/presentation/bloc/post/post_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init()async {
  //feature ============> Posts

  //Bloc
  sl.registerFactory(()=>PostBloc(getPosts: sl() ));
  sl.registerFactory(()=> AddDeletUpdatePostsBloc(addPost: sl(), deletPost: sl(), updatePost: sl()));
    
    //usecases
    sl.registerLazySingleton(()=> GetPosts(postRepositories: sl()));
     sl.registerLazySingleton(()=> AddPost(repositories: sl()));

      sl.registerLazySingleton(()=> DeletPost(repositories: sl()));
       sl.registerLazySingleton(()=> UpdatePost(repositories: sl()));
  //Repositories
  sl.registerLazySingleton<PostRepositories>(()=> PostRepositoriesImp(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));  

  //datasources
       sl.registerLazySingleton<PostRemoteDataSource>(()=> PostRemoteDataSourceImpl(client: sl()));
       sl.registerLazySingleton<LocalDataSource>(()=> LocalDataSourceImp(sharedPreferences: sl(),));
 //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(internetConnectionChecker: sl()));
//! External


  final sharedPreferences = await SharedPreferences.getInstance();
  final internetConnectionChecker =await InternetConnectionChecker.createInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
sl.registerLazySingleton(()=>internetConnectionChecker );


}
