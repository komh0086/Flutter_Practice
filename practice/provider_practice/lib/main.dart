import 'package:flutter/material.dart';
import 'package:provider_practice/Common/view/splash_screen.dart';
import 'package:provider_practice/User/view/login_Screen.dart';
import 'package:provider_practice/Common/component/custom_text_form_field.dart';

void main() {
  runApp(
    const _App(),
  );
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSans'),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
