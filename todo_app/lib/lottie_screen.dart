import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatefulWidget {
  const LottieScreen({super.key});

  @override
  State<LottieScreen> createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Lottie.network(
            'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
          // child: Lottie.asset("animations/animation_lo3c1lvi.json"),
      ),
      );

  }
}
