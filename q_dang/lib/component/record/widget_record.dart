import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:q_dang/constant/constants.dart';

import '../../model/Redord.dart';

class WidgetRecord extends StatelessWidget {
  Record record;
  Color? mainColor;

  List<String> TestNickNames = ["테스트1", "테스트2", "테스트3"];

  WidgetRecord({super.key, required this.record});

  void init() {
    if (record.result.contains("패")) {
      mainColor = const Color(0xFF424242);
    } else {
      mainColor = kMainColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    init();

    return Container(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Container(
                height: size.height * 0.1,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1.5,
                      color: mainColor!,
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        record.result,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            //     background: Paint()
                            //       ..color = mainColor!
                            //       ..strokeWidth = 17
                            //       ..style = PaintingStyle.stroke,
                            backgroundColor: mainColor,
                            color: Colors.white),
                      ),
                      Column(
                        children: TestNickNames.map((e) => Text(e)).toList(),
                      )
                    ]))));
  }
}
