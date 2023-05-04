import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilderScreen extends StatefulWidget{

  @override
  State<FutureBuilderScreen> createState() => _FutureBuilderScreenState();
  
}

class _FutureBuilderScreenState extends State<FutureBuilderScreen> {
  final textStyle = TextStyle(
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getNumber(),//getNumber가 값을 반환할때까지 기다렸다가 반환하면 builder한번 더 실행
        builder: (context, snapshot){
          if(!snapshot.hasData){//snapshot이 Data를 가지고 있지 않을때 렌더링
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // if(snapshot.connectionState == ConnectionState.waiting){
          //   //data를 기다리고 있을때 위젯 렌더링
          // }
          if(snapshot.hasError){
            //에러가 났을때 위젯 렌더링
            throw Exception('에러가 났을때');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'FutureBuilder',
                style: textStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                )
              ),
              Text(
                'ConState : ${snapshot.connectionState}',
                style: textStyle
              ),
              Text(
                'Data : ${snapshot.data}',
              ),
              Text(
                'Error : ${snapshot.error}',
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    
                  });
                }, 
                child: Text('Button'),
                )
            ],
          );
        },
      )
      );
  }

  Future<int> getNumber() async{//그냥 3초 기다렸다가 무작위 수 리턴
    await Future.delayed(Duration(seconds: 3));

    final random = Random();

    return random.nextInt(100);
  }
}