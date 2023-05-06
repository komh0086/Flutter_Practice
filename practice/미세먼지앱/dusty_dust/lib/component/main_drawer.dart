import 'package:dusty_dust/contant/colors.dart';
import 'package:flutter/material.dart';

const regions   = [
  '서울',
  '경기',
  '대구',
  '충남',
  '인천',
  '대전',
  '경북',
  '세종',
  '광주',
  '전북',
  '강원',
  '울산',
  '전남',
  '부산',
  '제주',
  '충북',
  '경남'
];

class MainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              '지역 선택',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ...regions.map((e) => renderListTile(e)).toList(),//...을 붙이면 List형태를 퍼뜨려주는 역할
        ]
      ),
    );
  }

  Widget renderListTile(String region){
    return ListTile(
      onTap: (){},
      tileColor: Colors.white,//기본 타일 색
      selectedTileColor: lightColor,//선택된 타일 색
      selectedColor: Colors.black,//선택된 타일의 글자 색
      selected: region.contains('서울') ? true : false,//처음 선택 됐는지 지정
      title: Text(region),
    );
  }
}