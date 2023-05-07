import 'package:flutter/material.dart';

import '../contant/colors.dart';

class MainCard extends StatelessWidget {
  final Widget child;

  MainCard({required this.child});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      color: lightColor,
      child: child,
    );
  }
}
