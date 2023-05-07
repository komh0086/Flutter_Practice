import 'package:dusty_dust/component/main_card.dart';
import 'package:flutter/material.dart';

import '../contant/colors.dart';
import '../contant/main_stat.dart';
import 'card_title.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: MainCard(
        child: LayoutBuilder(builder: (context, constraint) {
          //constraint변수를 통해 상위 위젯의 사이즈를 가져올 수 있음
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardTitle(title: '종류별 통계'),
              Expanded(
                child: ListView(
                  physics: const PageScrollPhysics(), //페이지가 넘어가듯이 스크롤
                  scrollDirection:
                      Axis.horizontal, //가로로 리스트 뷰를 스크롤한다. 높이 지정을 해야함
                  children: [
                    MainStat(
                      category: '미세먼지',
                      imgPath: 'asset/img/best.png',
                      level: '최고',
                      stat: '0㎛',
                      width: constraint.maxWidth / 3,
                    ),
                    MainStat(
                      category: '미세먼지',
                      imgPath: 'asset/img/best.png',
                      level: '최고',
                      stat: '0㎛',
                      width: constraint.maxWidth / 3,
                    ),
                    MainStat(
                      category: '미세먼지',
                      imgPath: 'asset/img/best.png',
                      level: '최고',
                      stat: '0㎛',
                      width: constraint.maxWidth / 3,
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
