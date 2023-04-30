import 'package:flutter/material.dart';
import 'package:random_number_generator/component/numberRow.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  int maxNumber;
  SettingsScreen({required this.maxNumber});
  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  void initState(){
    super.initState();
    //setting위젯을 생성하면 최초로 실행되면서 widget에 있는 변수를 가져올 수 있음
    maxNumber = widget.maxNumber.toDouble();
  }

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
                    _Body(maxNumber: maxNumber),
                    _Footer(
                      maxNumber: maxNumber, 
                      onSliderChanged: onSliderChanged,
                      onButtonPressed: onButtonPressed,
                      )
                  ],
                ))));
  }

  void onButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());//메인화면 돌아가기
  }

  void onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }
}

class _Body extends StatelessWidget{
  double maxNumber;

  _Body({required this.maxNumber});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(number: maxNumber.toInt(),),
      );
  }

}

class _Footer extends StatelessWidget{
  double maxNumber;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onButtonPressed;

  _Footer({
    required this.maxNumber, 
    required this.onSliderChanged,
    required this.onButtonPressed
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 100000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
            onPressed: onButtonPressed,
            child: Text('저장'),
            style: ElevatedButton.styleFrom(primary: RED_COLOR)),
      ],
    );
  }
  
}