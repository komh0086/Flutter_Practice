import 'package:dusty_dust/contant/colors.dart';
import 'package:flutter/material.dart';

import '../component/main_app_bar.dart';
import '../component/main_drawer.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
        ],
      ),
    );
  }

}