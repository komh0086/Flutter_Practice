import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/Screen/Screen_settings.dart';
import 'package:random_number_generator/constant/color.dart';

class mainScreen extends StatefulWidget {
  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List<int> randomNumber = [123, 456, 789];
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
            _Header(),
            _Body(randomNumber: randomNumber),
            _Footer(onPressed: onRandomNumberGenerate)
          ],
        ),
      ),
    );
  }

  void onRandomNumberGenerate() {
    final rand = Random();

    final Set<int> newNumbers = {};
    while (newNumbers.length != 3) {
      final number = rand.nextInt(1000);
      newNumbers.add(number);
    }
    setState(() {
      randomNumber = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
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
          onPressed: () {
            //push : list에서 add와 비슷
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext buildContext) {
              return SettingsScreen();
            }));
          },
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
                child: Row(
                    children: e.value
                        .toString()
                        .split('')
                        .map((x) => Image.asset(
                              'asset/img/$x.png',
                              height: 70,
                              width: 50,
                            ))
                        .toList()),
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
