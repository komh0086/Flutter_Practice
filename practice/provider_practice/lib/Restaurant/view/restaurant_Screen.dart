import 'package:actual/Common/model/cursor_pagnation_model.dart';
import 'package:actual/Restaurant/provider/restaurant_provider.dart';
import 'package:actual/Restaurant/view/restaurant_detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/restaurant_Card.dart';

class RestaurantScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(restaurantProvider);

    if(data is CursorPaginationLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    data as CursorPagination;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
              itemCount: data.data.length,
              itemBuilder: (_, index) {
                final pitem = data.data[index];
                
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => RestaurantDetailScreen(id : pitem.id))
                    );
                  },
                  child: RestaurantCard.fromModel(
                    model: pitem
                    ),
                    );
              },
              separatorBuilder: (_, index) {
                return SizedBox(
                  height: 16,
                );
              },
            )
          );
  }
}
