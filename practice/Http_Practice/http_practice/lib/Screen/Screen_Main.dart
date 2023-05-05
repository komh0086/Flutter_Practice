import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../model/Person.dart';

class ScreenMain extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    //이런느낌으로 통신하고
    var jsonString = http.get(Uri.parse('http://www.youtube.com')).toString();
    //이렇게 맵으로 바꾸고
    Map<String, dynamic> userMap = jsonDecode(jsonString);
    //이걸로 객체로 매핑하고
    var user = Person.fromJson(userMap);
    //이건 객체를 json으로 바꾸는거고
    String json = jsonEncode(user);

    return Scaffold(
      body: Center(
        child: Text('asdf'),
      ),
    );
  }

}