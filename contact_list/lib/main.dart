import 'package:contact_list/home_page.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contact List",
      theme: ThemeData(
          // primaryColor: const Color(0xFF00838F)
        primarySwatch: Colors.purple ),

    home: const HomePage(),
    );
  }
}



