import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ); //포멧 지정가능
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Colors.pink[100], //100~900까지 100단위로 넣으면 색의 진한정도를 정할 수 있음
        body: SafeArea(
            bottom: false, //SafeArea를 아랫부분만 적용하지 않음
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  _TopPart(
                    selectedDate: selectedDate,
                    onPressed: onHeartPressed,
                  ),
                  _BottomPart(),
                ]))));
  }

  void onHeartPressed() {
    DateTime now = DateTime.now();
    showCupertinoDialog(
        context: context,
        barrierDismissible: true, //컨테이너의 바깥부분을 터치하면 닫힘
        //builder에 빌드하는 함수 작성
        builder: (BuildContext context) {
          return Align(
              alignment: Alignment.bottomCenter, //Dialog정렬
              child: Container(
                color: Colors.white,
                height: 300,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate,
                  maximumDate: DateTime(
                    now.year,
                    now.month,
                    now.day,
                  ),
                  onDateTimeChanged: (DateTime dt) {
                    setState(() {
                      selectedDate = dt;
                    });
                  },
                ),
              ));
        });
  }
}

class _TopPart extends StatelessWidget {
  _TopPart({required this.selectedDate, required this.onPressed, Key? key})
      : super(key: key);

  VoidCallback onPressed;
  DateTime selectedDate;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
        child: Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: textTheme.headline1,
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난날',
                style: textTheme.headline2,
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodyText1,
              ),
            ],
          ),
          IconButton(
            iconSize: 60.0,
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: onPressed,
          ),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: textTheme.bodyText2,
          ),
        ],
      ),
    ));
  }
}

class _BottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/middle_image.png'));
  }
}
