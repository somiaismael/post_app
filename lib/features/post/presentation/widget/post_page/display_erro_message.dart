import 'package:flutter/material.dart';

class DisplayErroMessage extends StatelessWidget {
  const DisplayErroMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("DisplayErroMessage"),);
  }
}