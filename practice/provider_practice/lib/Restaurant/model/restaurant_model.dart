import 'package:json_annotation/json_annotation.dart';
import 'package:provider_practice/Common/util/DataUtil.dart';

part 'restaurant_model.g.dart';
enum RestaurantPriceRange{
  expensive,
  medium,
  cheap
}
@JsonSerializable()
class RestaurantModel{
  final String id;
  final String name;

  @JsonKey(//pathToUrl은 static으로 선언
    fromJson: DataUtils.pathToUrl
  )
  final String thumbUrl;

  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel
  ({required this.id,
  required this.name,
  required this.thumbUrl,
  required this.tags,
  required this.priceRange,
  required this.ratings,
  required this.ratingsCount,
  required this.deliveryTime,
  required this.deliveryFee,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json)
  =>_$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson()
  =>_$RestaurantModelToJson(this);

  // factory RestaurantModel.fromJson({required Map<String, dynamic> json}){
  //   return RestaurantModel(
  //     id: json['id'],
  //     name: json['name'],
  //     thumbUrl: json['thumbUrl'],
  //     tags: List<String>.from(json['tags']),
  //     priceRange: RestaurantPriceRange.values.firstWhere(
  //       (element) => element.name == json['priceRange']), 
  //     ratingsCount: json['ratingsCount'],
  //     deliveryTime: json['deliveryTime'],
  //     deliveryFee: json['deliveryFee'],
  //     ratings: json['ratings'],
  //     );
  // }
}