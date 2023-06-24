import 'package:json_annotation/json_annotation.dart';
import 'package:provider_practice/Common/util/DataUtil.dart';
import 'package:provider_practice/Restaurant/model/restaurant_model.dart';

part 'restaurant_detail_model.g.dart';

@JsonSerializable()//flutter pub run build_runner build명령어로 g.dart파일 생성
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
  => _$RestaurantDetailModelFromJson(json);

//   factory RestaurantDetailModel.fromJson({
//     required Map<String, dynamic> json,
//   }){
//     return RestaurantDetailModel(
//       id: json['id'],
//       name: json['name'],
//       thumbUrl: json['thumbUrl'],
//       tags: List<String>.from(json['tags']),
//       priceRange: RestaurantPriceRange.values.firstWhere(
//         (element) => element.name == json['priceRange']), 
//       ratingsCount: json['ratingsCount'],
//       deliveryTime: json['deliveryTime'],
//       deliveryFee: json['deliveryFee'],
//       ratings: json['ratings'],
//       detail: json['detail'], 
//       products: json['products'].map<RestaurantProductModel>(
//         (e) => RestaurantProductModel.fromJson(
//           json: e
//           ),
//       ).toList(),
//     );
//   }
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
  => _$RestaurantProductModelFromJson(json);

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