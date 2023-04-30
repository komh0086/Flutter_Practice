import 'package:flutter/material.dart';
import 'package:q_dang/component/record/widget_record.dart';

class ScreenHome extends StatefulWidget {
//여기서 API호출 받고 매핑

  @override
  State<StatefulWidget> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<String> TestRecordList = ['패', '패', '승', '승', '승'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(10),
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
              color: Colors.grey,
              height: 1.5,
            ),
            Text('나의 경기전적'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: TestRecordList
              .map((e) => WidgetRecord(record: e)).toList(),
            )
          ]),
      ),
    );
  }
}
