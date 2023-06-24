import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<String> tags;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;

  const RestaurantCard(
      {super.key,
      required this.image,
      required this.name,
      required this.tags,
      required this.ratingsCount,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.ratings});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            //테두리 깎는 위젯
            borderRadius: BorderRadius.circular(12),
            child: image,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(tags.join(' · ')),
          const SizedBox(
            height: 8,
          ),
          Text('여기엔 아이콘 + 평점, 배달시간 등의 정보'),
        ],
      ),
    );
  }
}
