import 'package:flutter/material.dart';
import 'package:todo_app/lottie_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LottieScreen() ,
    );
  }
}
