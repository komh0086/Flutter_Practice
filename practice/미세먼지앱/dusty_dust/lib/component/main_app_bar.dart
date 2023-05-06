import 'package:flutter/material.dart';

import '../contant/colors.dart';

class MainAppBar extends StatelessWidget{
  
  final ts = const TextStyle(//자주 쓰는 스타일 정의
    color: Colors.white,
    fontSize: 30,
  );
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
            expandedHeight: 500,//높이 늘리기
            backgroundColor: primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: kToolbarHeight),//앱바의 높이만큼 margin 생성
                  child: Column(
                    children: [
                      Text(
                        '서울',
                        style: ts.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        )
                      ),
                      const SizedBox(height: 20),
                      Text(
                        DateTime.now().toString(),
                        style: ts.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'asset/img/mediocre.png',
                        width: MediaQuery.of(context).size.width/2,
                        ),
                      const SizedBox(height: 20),
                      Text(
                        '보통',
                        style: ts.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        )
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '나쁘지 않네요!',
                        style: ts.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

}