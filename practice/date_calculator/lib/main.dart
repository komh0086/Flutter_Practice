import 'package:date_calculator/screen/Screen_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'sunflower',
          textTheme: TextTheme(
              headline1: TextStyle(
                  color: Colors.white, fontFamily: 'parisienne', fontSize: 60),
              headline2: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w700),
              bodyText1: TextStyle(color: Colors.white, fontSize: 30),
              bodyText2: TextStyle(color: Colors.white, fontSize: 50))),
      home: MainScreen(),
    );
  }
}
