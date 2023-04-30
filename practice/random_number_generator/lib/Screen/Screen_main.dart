import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/Screen/Screen_settings.dart';
import 'package:random_number_generator/component/numberRow.dart';
import 'package:random_number_generator/constant/color.dart';

class mainScreen extends StatefulWidget {
  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List<int> randomNumber = [123, 456, 789];
  int maxNumber = 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), //child위젯에 패딩 적용 LTRB, symetric, all, zero속성이 있음
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(onPressed: saveSetting),
            _Body(randomNumber: randomNumber),
            _Footer(onPressed: onRandomNumberGenerate)
          ],
        ),
      ),
    );
  }

  void saveSetting() async {//설정갑을 받아오기 위해 async로 선언
    //push : list에서 add와 비슷
    final int? result = await Navigator.of(context)//설정화면에서 보내주는 파라미터를 기다려야되느까 await선언
        .push<int>(MaterialPageRoute(builder: (BuildContext buildContext) {//push<int>로 int값을 받아오는걸 명시할 수 있음
        return SettingsScreen(maxNumber: maxNumber);
        }));

    if(result != null){//뒤로가기 버튼이나 아이폰에서 슬라이드로 메인화면으로 돌아오면 result가 null값을 가질 수 있음 -> 예외처리
      setState((){    
      maxNumber = result;
    });
    }
    
  }

  void onRandomNumberGenerate() {
    final rand = Random();

    final Set<int> newNumbers = {};
    while (newNumbers.length != 3) {
      final number = rand.nextInt(maxNumber);
      newNumbers.add(number);
    }
    setState(() {
      randomNumber = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;

  _Header({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '랜덤숫자 생성기',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.settings,
            color: RED_COLOR,
          ),
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  List<int> randomNumber;

  _Body({required this.randomNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: randomNumber
          .asMap() //배열을 key:value로 가져올 수 있음(e.key 또는 e.value)
          .entries
          .map((e) => Padding(
                padding: EdgeInsets.only(
                    bottom: e.key == 2
                        ? 0
                        : 16), //마지막 Image에는 아래 padding을 넣지 않으려고 사용
                child: NumberRow(number: e.value)
              ))
          .toList(),
    ));
  }
}

class _Footer extends StatelessWidget {
  VoidCallback onPressed;

  _Footer({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: RED_COLOR),
          onPressed: onPressed,
          child: Text('생성하기')),
    );
  }
}
