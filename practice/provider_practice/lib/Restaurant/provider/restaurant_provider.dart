import 'package:actual/Common/model/cursor_pagnation_model.dart';
import 'package:actual/Restaurant/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/restaurant_model.dart';

final restaurantProvider = 
  StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>(
    (ref){
      final repository = ref.watch(restaurantRepositoryProvider);

      final notifier = RestaurantStateNotifier(repository: repository);

      return notifier;
    }
    );

class RestaurantStateNotifier extends StateNotifier<CursorPaginationBase>{
  final RestaurantRepository repository;

  RestaurantStateNotifier({
    required this.repository,
  }): super(CursorPaginationLoading()){
    paginate();
  }
  
  paginate({
    int fetchCount = 20,
    // 추가로 데이터 더 가져오기
    // true - 추가로 데이터 더 가져옴
    // false - 새로고침
    bool fetchMore = false,
    // 강제로 다시 로딩하기
    // true - CursorPaginationLoading()
    bool forceRefetch = false,
  }) async{
    //5가지 상태
    //State의 상태
    //1) CursorPagination - 정상적으로 데이터가 있는 상태
    //2) CursorPaginationLoading - 데이터가 로딩중이 상태(현재 캐시 없음)
    //3) CursorPaginationError - 에러가 있는 상태
    //4) CursorPaginationRefetching - 첫번째 페이지부터 다시 데이터를 가져올때
    //5) CursorPaginationFetchMore - 추가 데이터를 paginate 해오라는 요청을 받았을때
  }
}