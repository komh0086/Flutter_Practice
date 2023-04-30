import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:q_dang/constant/constants.dart';

class WidgetRecord extends StatelessWidget {

  String record;

  WidgetRecord({required this.record});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(record),
            color: record.contains("패") ? Colors.grey[800] : kMainColor,
          )
        )
      );
  }
}
