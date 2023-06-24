import 'package:flutter/material.dart';
import 'package:provider_practice/Common/const/data.dart';
import 'package:provider_practice/Restaurant/model/restaurant_detail_model.dart';

class ProductCard extends StatelessWidget{
  final Image image;
  final String name;
  final String detail;
  final int price;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.detail,
    required this.price,
    });

  factory ProductCard.fromModel({
    required RestaurantProductModel model
  }){
    return ProductCard(
      image: Image.network(
        model.imgUrl,
        width: 110,
        height: 110,
        fit: BoxFit.cover,
        ), 
      name: model.name, 
      detail: model.detail, 
      price: model.price
      );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(//자식 위젯들의 높이가 무조건 최대로 고정 IntrinsicWidth도 있음
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: image
          ),
          SizedBox(width: 16.0,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(name),
                Text(detail),
                Text("$price"),
              ],
            ),
          )
        ],
      ),
    );
  }

}