import 'package:flutter/material.dart';
import '../appTheme/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(padding: EdgeInsetsGeometry.all(10),
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          color: secondaryColor,
        ),
      ),),
    );
    
  }
}
