import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_practice/Common/const/data.dart';
import 'package:provider_practice/Restaurant/component/restaurant_Card.dart';
import 'package:provider_practice/Restaurant/model/restaurant_model.dart';
import 'package:provider_practice/Restaurant/view/restaurant_detail_Screen.dart';

class RestaurantScreen extends StatelessWidget {
  Future<List> pagenateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final response = await dio.get('http://$IP/restaurant',
        options: Options(headers: {
          'authorization': 'Bearer $accessToken',
        }));
    return response.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<List>(
            future: pagenateRestaurant(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];
                  RestaurantModel restaurantModel = RestaurantModel.fromJson(item);
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RestaurantDetailScreen(id : restaurantModel.id))
                      );
                    },
                    child: RestaurantCard.fromModel(
                      model: restaurantModel
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
