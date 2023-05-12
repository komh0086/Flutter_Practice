import 'package:dusty_dust/contant/colors.dart';
import 'package:flutter/material.dart';

import '../contant/regions.dart';

typedef OnRegionTap = void Function(String region);

class MainDrawer extends StatelessWidget {
  final OnRegionTap onRegionTap;
  final String selectedRegion;

  const MainDrawer({super.key, required this.onRegionTap, required this.selectedRegion});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: ListView(children: [
        const DrawerHeader(
          child: Text(
            '지역 선택',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        ...regions
            .map((e) => renderListTile(e))
            .toList(), //...을 붙이면 List형태를 퍼뜨려주는 역할
      ]),
    );
  }

  Widget renderListTile(String region) {
    return ListTile(
      onTap: () {
        onRegionTap(region);
      },
      tileColor: Colors.white, //기본 타일 색
      selectedTileColor: lightColor, //선택된 타일 색
      selectedColor: Colors.black, //선택된 타일의 글자 색
      selected: region.contains(selectedRegion) ? true : false, //처음 선택 됐는지 지정
      title: Text(region),
    );
  }
}
