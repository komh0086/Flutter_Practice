import 'package:flutter/material.dart';

class StreamBuilderScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen>{

  final textStyle = TextStyle(
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(//StreamBuilder<int>와 같이 받는 값을 명시할 수 있음
        stream: streamNumbers(),//getNumber가 값을 반환할때까지 기다렸다가 반환하면 builder한번 더 실행
        builder: (context, snapshot){//BuildContext context, AsyncSnapshot<int> snapshot 객체를 매개변수로 가짐
          if(!snapshot.hasData){//snapshot이 Data를 가지고 있지 않을때 렌더링
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // if(snapshot.connectionState == ConnectionState.active){
          //   //data를 받고있는 상태일때 위젯 렌더링
          // }
          // if(snapshot.connectionState == ConnectionState.done){
          //   //data를 모두 받은 상태일때 위젯 렌더링
          // }
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
                  setState(() {});
                }, 
                child: Text('Button'),
                )
            ],
          );
        },
      )
      );
  }

  Stream<int> streamNumbers() async*{//async* - 제너레이터를 만든단 뜻, 미리 연산을 하는 것이 아니라 요청이 있을때까지는 연산 하는 걸 미루어 두었다가 필요할 때 처리하는것을 뜻함
    for(int i=0;i<10;i++){
      await Future.delayed(Duration(seconds: 1));

      yield i;//return과 유사하지만 한번 반환을 하고 중지하는 것이 아니라 열린채로 있어 필요할때 다른 연산을 할 수 있다.
    }
  }
}