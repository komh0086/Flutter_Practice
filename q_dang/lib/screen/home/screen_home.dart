import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
//여기서 API호출 받고 매핑
  List<String> TestGroupList = ['1', '2', '3', '4'];

  @override
  State<StatefulWidget> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.1,
              decoration: BoxDecoration(border: Border.all()),
              child: Center(
                child: Text('***님 환영합니다 이미지'),
              ),
            ),
            Container(
              height: height * 0.02,
              child: Text('최근 경기'),
            ),
            Container(
              height: height * 0.1,
              width: width,
              decoration: BoxDecoration(border: Border.all()),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: widget.TestGroupList.map((e) => Text('모임 $e'))
                        .toList()),
              ),
            ),
            Container(
              color: Colors.grey,
              height: 1.5,
            ),
          ]),
    );
  }
}
