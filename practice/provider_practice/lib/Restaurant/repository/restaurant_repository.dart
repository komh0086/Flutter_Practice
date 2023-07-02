import 'package:actual/Common/dio/dio.dart';
import 'package:actual/Common/model/cursor_pagnation_model.dart';
import 'package:actual/Common/model/pagination_params.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../Common/const/data.dart';
import '../model/detail/restaurant_detail_model.dart';
import '../model/restaurant_model.dart';

part 'restaurant_repository.g.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref){
  final dio = ref.watch(dioProvider);

  final repository = RestaurantRepository(dio, baseUrl: 'http://$IP/restaurant');

  return repository;
});

@RestApi()
abstract class RestaurantRepository{
  factory RestaurantRepository(Dio dio, {String baseUrl})
    = _RestaurantRepository;

  @GET('/')
  @Headers({
    'accessToken' : 'true'
  })
  Future<CursorPagination<RestaurantModel>> paginate({
    @Queries() paginationParams = const PaginationParams(),
  });

  @GET('/{rid}')
  @Headers({
    'accessToken' : 'true'
  })
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path() required String rid,
  });
}