import 'package:flutter/material.dart';

import '../contant/colors.dart';

class CardTitle extends StatelessWidget {
  final String title;

  CardTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
