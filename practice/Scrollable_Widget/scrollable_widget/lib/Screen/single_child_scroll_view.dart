import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';

import '../layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget{

  final List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: renderPerformance(),
    );
  }
  //리스트를 매핑하여 보여주는 방식
  Widget renderPerformance(){
    return SingleChildScrollView(
        child: Column(
          children: 
            numbers.map((e) => renderContainer(color: rainbowColors[e % rainbowColors.length])).toList(),
        ),
      );
  }
  Widget renderClip(){
    return SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        clipBehavior: Clip.none,//잘리지 않음
        child: renderContainer(color: Colors.black),
      );
  }
  
  Widget renderAlwaysScroll(){
    return SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),//자식위젯의 크기가 작아도 강제로 스크롤이 가능함
        child: renderContainer(color: Colors.black),
      );
  }

  Widget renderSimple(){
    return SingleChildScrollView(
        child: Column(
          children: 
            rainbowColors.map((color) => renderContainer(color: color)).toList(),
          
        ),
      );
  }

  Widget renderContainer({
    required Color color,
  }){
    return Container(
      height: 300,
      color: color);
  }
}