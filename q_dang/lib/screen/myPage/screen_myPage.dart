import 'package:flutter/material.dart';
import 'package:q_dang/constant/constants.dart';

class ScreenMyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScreenMyPageState();
}

class _ScreenMyPageState extends State<ScreenMyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(),
          _Body1(onSettingPressed: onSettingPressed,),
          _Body2(),
        ],
      )
    );
  }
  void onSettingPressed(){

  }
}

class _Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainColor,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.person,
              color: kSubColor,
              ),
            Text(
              '마이페이지',
              style: TextStyle(color: kSubColor),
              ),
            Expanded(
              child: Container(),),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: kSubColor,
                ),
              onPressed: (){},
            )
          ],
        ),
      )
    );
  }
}

class _Body1 extends StatelessWidget{

  VoidCallback onSettingPressed;

  _Body1({required this.onSettingPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('프로필 이미지'),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('*** 님'),
              Text('모두 재밌는 당구해요~'),
            ],
          ),
          Expanded(child: Container(),),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              side: const BorderSide(
                color: kMainColor,
                width: 1.5
                ),
              foregroundColor: kMainColor,
              primary: kMainColor
            ),
            onPressed: onSettingPressed,
            child: const Text('프로필 수정'),
          )
        ],
      ),
    );
  }
}

class _Body2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text('나의 실력 분포도'),
              Text('경기 전적을 통하여 분석한 ***님의 실력 분포도'),
              
          ],
        ),
      ),
    );
  }
}
