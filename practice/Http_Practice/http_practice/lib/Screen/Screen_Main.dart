import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ScreenMain extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    final response = getTacos();
    print(response);
    return Scaffold(
      body: Center(
        child: Text('asdf'),
      ),
    );
  }

  Future<http.Response> getTacos(){
    return http.get(Uri.parse('localhost:8080/design/recent'));
  }

}