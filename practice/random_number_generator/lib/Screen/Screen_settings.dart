import 'dart:html';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Row(
                      children: maxNumber
                          .toInt()
                          .toString()
                          .split('')
                          .map((e) => Image.asset(
                                'asset/img/$e.png',
                                width: 50,
                                height: 70,
                              ))
                          .toList(),
                    )),
                    Slider(
                      value: maxNumber,
                      min: 10000,
                      max: 1000000,
                      onChanged: (double value) {
                        setState(() {
                          maxNumber = value;
                        });
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text('저장'),
                        style: ElevatedButton.styleFrom(primary: RED_COLOR)),
                  ],
                ))));
  }
}
