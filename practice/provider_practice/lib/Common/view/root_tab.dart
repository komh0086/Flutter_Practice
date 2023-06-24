import 'package:flutter/material.dart';
import 'package:provider_practice/Common/const/colors.dart';
import 'package:provider_practice/Common/layout/default_layout.dart';
import 'package:provider_practice/Restaurant/view/restaurant_Screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);

    controller.addListener(tablistener);
  }

  void tablistener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  void dispose() {
    controller.removeListener(tablistener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'RootTab',
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(), //좌우 스크롤 불가
        controller: controller,
        children: [
          RestaurantScreen(),
          Container(
            child: Center(child: Text('음식')),
          ),
          Container(
            child: Center(child: Text('주문')),
          ),
          Container(
            child: Center(child: Text('프로필')),
          ),
        ],
      ),
      bottomNavigationBar: renderBottomNavigationBar(),
    );
  }

  BottomNavigationBar renderBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: PRIMARY_COLOR,
      unselectedItemColor: BODY_TEXT_COLOR,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        controller.animateTo(index);
      },
      currentIndex: index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood_outlined),
          label: '음식',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_outlined),
          label: '주문',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined), label: '프로필'),
      ],
    );
  }
}
