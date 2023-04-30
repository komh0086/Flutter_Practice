import 'package:flutter/material.dart';
import 'package:q_dang/component/appBar.dart';

import '../constant/constants.dart';
import 'home/Screen_Home.dart';
import 'mypage/Screen_MyPage.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    ScreenHome(),
    ScreenMyPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? homeAppBar() : null,
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: kMainColor,
        unselectedIconTheme: IconThemeData(color: Colors.black),
        unselectedItemColor: Colors.black,
        selectedItemColor: kSubColor,
        selectedIconTheme: IconThemeData(color: kSubColor),
        onTap: _onItemTapped,
      ),
    );
  }
}
