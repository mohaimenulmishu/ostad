import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatefulWidget {
  const LottieScreen({super.key});

  @override
  State<LottieScreen> createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen> {
  final urlLottie = [
    'https://lottie.host/6130446b-a4ef-42e2-9ec5-ab64cc126e10/dQYj2FGZNp.json'
    'https://lottie.host/2ede1181-fcd4-4a89-bcb1-1f30ca70789f/iCauQPjdkf.json'
    'https://lottie.host/d58e3767-9933-4ea8-81d5-4c522639a98e/KonLed2cIA.json'
    'https://lottie.host/3f826641-58cc-4774-9097-ab215024f5cb/xIsrDvrCx2.json'
    


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Lottie.network(
            'https://lottie.host/6130446b-a4ef-42e2-9ec5-ab64cc126e10/dQYj2FGZNp.json'),
      ),
    );
  }
}
