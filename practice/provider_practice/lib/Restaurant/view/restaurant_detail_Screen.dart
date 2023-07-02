import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Common/layout/default_layout.dart';
import '../../product/component/product_Card.dart';
import '../component/restaurant_Card.dart';
import '../model/detail/restaurant_detail_model.dart';
import '../repository/restaurant_repository.dart';

class RestaurantDetailScreen extends ConsumerWidget{
  final String id;
  const RestaurantDetailScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: '불타는 떡볶이',
      child: FutureBuilder<RestaurantDetailModel>(
        future: ref.watch(restaurantRepositoryProvider).getRestaurantDetail(rid: id),
        builder: (context, AsyncSnapshot<RestaurantDetailModel> snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }

          return CustomScrollView(
            slivers: [
              renderTop(model: snapshot.data!),
              renderLabel(),
              renderProducts(list: snapshot.data!.products)
            ],
          );
        },
      )
      );
  }

  SliverPadding renderProducts({
    required List<RestaurantProductModel> list
  }){
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index){
            final RestaurantProductModel product = list[index];
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProductCard.fromModel(model: product),
            );
          },
          childCount: list.length,
        ),
      ),
    );
  }
  SliverToBoxAdapter renderLabel(){
    return SliverToBoxAdapter(
      child: Text("메뉴"),
    );
  }
  SliverToBoxAdapter renderTop({
    required RestaurantDetailModel model
  }){
    return SliverToBoxAdapter(
      child: RestaurantCard.fromModel(model: model, isDetail: true,)
    );
  }
}