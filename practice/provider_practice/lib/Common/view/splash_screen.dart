import 'package:flutter/material.dart';
import 'package:provider_practice/Common/const/colors.dart';
import 'package:provider_practice/Common/const/data.dart';
import 'package:provider_practice/Common/layout/default_layout.dart';
import 'package:provider_practice/Common/view/root_tab.dart';

import '../../User/view/login_Screen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    checkToken();
  }

  void checkToken() async{
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if(refreshToken == null || accessToken == null){
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
          )
        , (route) => false);
    }else{
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => RootTab(),
          )
        , (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/img/logo/logo.png',
                width: MediaQuery.of(context).size.width /2
              ),
              SizedBox(height: 16,),
              CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
        ),
      )
    );
  }
}