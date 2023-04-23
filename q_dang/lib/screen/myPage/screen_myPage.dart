import 'package:flutter/material.dart';

class ScreenMyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScreenMyPageState();
}

class _ScreenMyPageState extends State<ScreenMyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('여기는 마이페이지'),
      ),
    );
  }
}
