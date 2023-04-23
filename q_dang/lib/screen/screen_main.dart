import 'package:flutter/material.dart';

import '../util/constants.dart';
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
      appBar: AppBar(
        title: const Text(
          '여기 타이틀',
          style: TextStyle(color: kMainColor),
        ),
        leading: IconButton(
          color: Colors.grey,
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              color: Colors.grey, onPressed: () {}, icon: Icon(Icons.search)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.5,
          ),
        ),
        elevation: 0,
        backgroundColor: kSubColor,
      ),
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
