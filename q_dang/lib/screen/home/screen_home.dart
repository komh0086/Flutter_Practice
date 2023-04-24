import 'package:flutter/material.dart';
import 'package:q_dang/widget/home/widget_smallGroupMember.dart';

import '../../util/constants.dart';

class ScreenHome extends StatefulWidget {
//여기서 API호출 받고 매핑
  List<String> TestGroupList = ['1', '2', '3', '4'];
  List<String> TestRecordList = ['패', '패', '승', '승', '승'];

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
            // Container(
            //   height: height * 0.1,
            //   width: width,
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //         children: widget.TestGroupList.map(
            //             (e) => WidgetSmallGroupMember(name: e)).toList()),
            //   ),
            // ),
            Container(
              color: Colors.grey,
              height: 1.5,
            ),
            Text('나의 경기전적'),
          ]),
    );
  }
}
