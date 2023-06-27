import 'dart:math';

import 'package:actual/Common/dio/dio.dart';
import 'package:actual/Restaurant/repository/restaurant_repository.dart';
import 'package:actual/Restaurant/view/restaurant_detail_Screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../Common/const/data.dart';
import '../component/restaurant_Card.dart';
import '../model/restaurant_model.dart';

class RestaurantScreen extends StatelessWidget {
  Future<List<RestaurantModel>> pagenateRestaurant() async {
    final dio = Dio();

    dio.interceptors.add(
      CustomInterceptor(storage: storage),
    );

    final res = 
      await RestaurantRepository(dio, baseUrl: 'http://$IP/restaurant')
      .pagenate();

    return res.data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<List<RestaurantModel>>(
            future: pagenateRestaurant(),
            builder: (context, AsyncSnapshot<List<RestaurantModel>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final pitem = snapshot.data![index];
                  
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
              );
            },
          )),
    );
  }
}
