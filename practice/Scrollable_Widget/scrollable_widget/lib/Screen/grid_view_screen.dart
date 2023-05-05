import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../layout/main_layout.dart';

class GridViewScreen extends StatelessWidget{
  final List<int> numbers = List.generate(100, (index) => index);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'GridView',
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,//그리는 위젯의 가로 크기를 지정, 지정한 크기에서 가장 많이 넣을 수 있는 만큼 들어감
        ), 
        itemBuilder: (context, index){
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length], 
            index: index);
        }
        ),
    );
  }

  Widget renderBuilder2(){
    return GridView.builder(
      itemCount: 100,//그리는 위젯의 개수 지정
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,//그리는 위젯의 최대 가로 크기를 지정, 지정한 크기에서 가장 많이 넣을 수 있는 만큼 들어감
      ), 
      itemBuilder: (context, index){
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length], 
          index: index);
      }
    );
  }

  //보이는 위젯만 그리고 안보이는 것은 지움 - 리소스를 아낄수 있음
  Widget renderBuilder(){
    return GridView.builder(
      itemCount: 100,//그리는 위젯의 개수 지정
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,//가로로 몇개 넣을지
        crossAxisSpacing: 12.0,//위젯간의 가로 간격
        mainAxisSpacing: 12.0,//위젯간의 세로 간격
      ), 
      itemBuilder: (context, index){
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length], 
          index: index);
      }
    );
  }

  //기본 하지만 리스트에 있는 위젯을 모두 그림
  Widget renderCount(){
    return GridView.count(
      crossAxisCount: 2,//가로로 몇개 넣을지
      crossAxisSpacing: 12.0,//위젯간의 가로 간격
      mainAxisSpacing: 12.0,//위젯간의 세로 간격
      children: numbers
        .map(
          (e) => renderContainer(
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
        ),
      );
    }
}