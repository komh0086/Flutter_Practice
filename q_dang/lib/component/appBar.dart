import 'package:flutter/material.dart';

import '../constant/constants.dart';

class homeAppBar extends StatelessWidget with PreferredSizeWidget{
  const homeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      title: Text(
        kAppName,
        style: TextStyle(color: kMainColor),
      ),
      actions: [
        IconButton(
            color: Colors.grey,
            onPressed: onNotificationPressed,
            icon: Icon(Icons.notifications)),
        IconButton(
          color: Colors.grey,
          onPressed: onSearchPressed,
          icon: Icon(Icons.search),
          )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.grey,
          height: 1.5,
        ),
      ),
      elevation: 0,
      backgroundColor: kSubColor,
    );
  }

  void onNotificationPressed(){

  }

  void onSearchPressed(){

  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}