import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/appTheme/app_theme.dart';
import 'features/post/presentation/bloc/add_delet_update_posts/add_delet_update_posts_bloc.dart';
import 'features/post/presentation/bloc/post/post_bloc.dart';
import 'features/post/presentation/pages/post_pages.dart';
import 'di/di.dart' as di;

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=> di.sl<PostBloc>()..add(GetAllPostsEvent())),
      BlocProvider(
        create: (context) => di.sl<AddDeletUpdatePostsBloc>(),  )
    ], child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Post App',
      theme: appTheme,
      home: PostPages()
    ))
    ;
  }
}

