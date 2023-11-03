import 'package:flutter/material.dart';
import 'package:tic_toc_toe_app/lottie_screen.dart';
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
