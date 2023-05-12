import 'package:flutter/material.dart';

import 'card_title.dart';
import 'main_card.dart';

class HourlyCard extends StatelessWidget {
  const HourlyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MainCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CardTitle(title: '시간별 미세먼지'),
          Column(
            children: List.generate(24, (index) {
              int hour = DateTime.now().hour;
              hour = (hour - index) % 24;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(hour < 10 ? '0$hour시' : '$hour시'),
                    Image.asset('asset/img/good.png', width: 20),
                    const Text('좋음'),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
