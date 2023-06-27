import 'package:flutter/material.dart';

import '../model/detail/restaurant_detail_model.dart';
import '../model/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<String> tags;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;
  final bool isDetail;
  final String? detail;

  const RestaurantCard(
      {super.key,
      required this.image,
      required this.name,
      required this.tags,
      required this.ratingsCount,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.ratings,
      this.isDetail = false,
      this.detail});

  factory RestaurantCard.fromModel({required RestaurantModel model, bool? isDetail}){
    return RestaurantCard(
      image: Image.network('${model.thumbUrl}',
          fit: BoxFit.cover),
      name: model.name,
      tags: model.tags,
      ratingsCount: model.ratingsCount,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
      ratings: model.ratings,
      isDetail: isDetail ?? false,
      detail: model is RestaurantDetailModel ? model.detail : null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if(isDetail)
          image,
          if(!isDetail)
          ClipRRect(//테두리 깎는 위젯
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
          if(detail != null && isDetail)
          SizedBox(height: 16,),
          if(detail != null && isDetail)
          Text(detail!),
        ],
      ),
    );
  }
}
