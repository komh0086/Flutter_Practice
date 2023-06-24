import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/restaurant_detail_Model.dart';
import '../model/restaurant_model.dart';

part 'restaurant_repository.g.dart';

@RestApi()
abstract class RestaurantRepository{
  factory RestaurantRepository(Dio dio, {String baseUrl})
    = _RestaurantRepository;

  @GET('/')
  Future<RestaurantModel> pagenate();

  @GET('/{id}')
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path('id') required String id
    });
}