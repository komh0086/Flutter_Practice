import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';
import 'package:scrollable_widget/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget{
  final List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListViewScreen', 
      body: renderListSeparaterBuilder(),
      );
  }

 Widget renderListSeparaterBuilder(){
  return ListView.separated(//ListView가 생성한 위젯 사이에 끼워넣는 위젯을 생성할 separatorBuilder 함수가 추가된 형태
    itemCount: 100,
    itemBuilder: (context, index){
      return renderContainer(
        color: rainbowColors[index % rainbowColors.length],
        index: index,
      );
    }, 
    separatorBuilder: (context, index){
      index++;
      if(index % 5 == 0){//이런식으로 5개의 위젯마다 다른 위젯을 추가할 수도 있음 광고 배너 추가할떄 많이 사용
        return renderContainer(
          color: Colors.black,
          index: index,
          height: 100,
        );
      }
      return Container();
    }, 
  );
 }

  //renderDefault와 다른점은 지금 화면에 보이는 것만 추가하는 방식 - 보이지 않는 위젯은 지워서 리소스를 아낄 수 있음
  Widget renderListBuilder(){
    return ListView.builder(
        itemCount: 100,//index가 0부터 100번 돌면서 itembuilder실행
        itemBuilder: (context, index){
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length], 
            index: index);
        }
      );
  }

  Widget renderDefault(){
    return ListView(
        children: numbers.map((e) => renderContainer(
          color: rainbowColors[e%rainbowColors.length], 
          index: e)).toList(),
      );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }){
    return Container(
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
      ),);
  }
}