import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';
import 'package:scrollable_widget/layout/main_layout.dart';

class ReorderableListViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'ReorderableListViewScreen', body: renderBuilder());
  }

  Widget renderBuilder() {
    return ReorderableListView.builder(
        //아이템이 보일때만 생성하고 안보일때는 지운다. 순서를 바꿀때 새로 생성된다.
        itemBuilder: (context, index) {
          return renderContainer(
              color: rainbowColors[numbers[index] % rainbowColors.length],
              index: numbers[index]);
        },
        itemCount: numbers.length, //Item의 갯수
        onReorder: (int oldIndex, int newIndex) {
          //순서를 바꿀때 사용하는 함수
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = numbers.removeAt(oldIndex);
            numbers.insert(newIndex, item);
          });
        });
  }

  Widget renderDefault() {
    return ReorderableListView(
      children: numbers
          .map((e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length], index: e))
          .toList(),
      //화면에서 순서를 바꿔주는 함수 실제 데터의 순서를 바꾸지는 않음
      //oldIndex - 순서를 바꾸기 전 인덱스, newIndex - 순서를 바꾼 후 인덱스
      /*
            oldIndex와 newIndex 모두 이동하기 전에 산정된다.
            [red, orange, yellow]
            red를 yellow 다음으로 옮기고 싶을때
            red: 0 oldIndex -> 3 newIndex
            [orange, yellow, red] 실질적인 Index는 2가 된다. newIndex는 3으로 써야함
            여기서 red를 맨 앞으로 옮길경우 oldIndex 2 -> newIndex 0
          */
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex, item);
        });
      },
    );
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
