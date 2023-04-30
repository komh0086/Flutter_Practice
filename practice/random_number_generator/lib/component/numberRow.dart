import 'package:flutter/widgets.dart';

class NumberRow extends StatelessWidget{

  int number;

  NumberRow({required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: number
            .toInt()
            .toString()
            .split('')
            .map((e) => Image.asset(
                  'asset/img/$e.png',
                  width: 50,
                  height: 70,
                ))
            .toList(),
    );
  }
}