import 'package:flutter/material.dart';

class WidgetSmallGroupMember extends StatelessWidget {
  String name;

  WidgetSmallGroupMember({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.person,
          ),
          Text('멤버' + this.name),
        ],
      ),
      padding: EdgeInsets.all(10),
    );
  }
}
