import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';

import '../layout/main_layout.dart';

class RefreshIndicatorScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'RefreshIndicator',
        body: RefreshIndicator(
          onRefresh: () async {
            //서버요청
            await Future.delayed(Duration(seconds: 3));
          },
          child: ListView(
            children: numbers
                .map((e) => renderContainer(
                    color: rainbowColors[e % rainbowColors.length], index: e))
                .toList(),
          ),
        ));
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    return Container(
      key: Key(index.toString()), //각각의 컨테이너가 다드게 인식할수 있도록
      height: height ?? 300,
      color: color ?? Colors.black,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
