import 'package:flutter/material.dart';
import 'package:q_dang/component/record/widget_record.dart';
import 'package:q_dang/constant/constants.dart';

import '../../model/Redord.dart';

class ScreenHome extends StatefulWidget {
//여기서 API호출 받고 매핑

  @override
  State<StatefulWidget> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Record> TestRecordList = [
    new Record(result: '패'),
    new Record(result: '승'),
    new Record(result: '패'),
    new Record(result: '패'),
    new Record(result: '승'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Container(
      height: height,
      child: Stack(children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    children: TestRecordList.map((e) => WidgetRecord(record: e))
                        .toList(),
                  )
                ]),
          ),
        ),
        Positioned(
            top: height * 0.765,
            child: Container(
              width: width,
              height: height * 0.1,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: OutlinedButton(
                  child: Text(
                    '새로운 경기 시작하기',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: kMainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {},
                ),
              ),
            ))
      ]),
    );
  }
}
