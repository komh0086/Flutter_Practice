import 'package:actual/Restaurant/model/restaurant_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../Common/util/DataUtil.dart';

part 'restaurant_detail_model.g.dart';

@JsonSerializable()//flutter pub run build_runner build명령어로 g.dart파일 생성후 직렬화
class RestaurantDetailModel extends RestaurantModel{

  final String detail;
  List<RestaurantProductModel> products;

  RestaurantDetailModel
  ({required super.id,
    required super.name,
    required super.thumbUrl,
    required super.tags,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.deliveryTime,
    required super.deliveryFee,
    required this.detail,
    required this.products
  });

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json)
  =>_$RestaurantDetailModelFromJson(json);
}

@JsonSerializable()
class RestaurantProductModel{
  final String id;
  final String name;
  @JsonKey(
    fromJson: DataUtils.pathToUrl
  )
  final String imgUrl;
  final String detail;
  final int price;

  RestaurantProductModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price
  });

  factory RestaurantProductModel.fromJson(Map<String, dynamic> json)
  =>_$RestaurantProductModelFromJson(json);

  // factory RestaurantProductModel.fromJson({
  //   required Map<String, dynamic> json
  // }){
  //   return RestaurantProductModel(
  //     id: json['id'],
  //     name: json['name'],
  //     imgUrl: 'http://$IP/${json['imgUrl']}', 
  //     detail: json['detail'], 
  //     price: json['price']
  //     );
  // }
}