import 'package:flutter/material.dart';

import 'Screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(//기본 폰트 지정
        fontFamily: 'sunflower',
      ),
      title: 'Dusty_Dust',
      home: HomeScreen(),
    )
  );
}
