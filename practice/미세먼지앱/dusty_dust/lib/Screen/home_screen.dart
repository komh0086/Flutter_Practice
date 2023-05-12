import 'package:dusty_dust/component/category_card.dart';
import 'package:dusty_dust/component/hourl_card.dart';
import 'package:dusty_dust/contant/colors.dart';
import 'package:dusty_dust/contant/regions.dart';
import 'package:dusty_dust/model/stat_and_status_model.dart';
import 'package:dusty_dust/repository/stat_repository.dart';
import 'package:flutter/material.dart';

import '../component/main_app_bar.dart';
import '../component/main_drawer.dart';
import '../model/stat_model.dart';
import '../utils/data_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String region = regions[0];

  List<Future> futures = [];

  Future<Map<ItemCode, List<StatModel>>> fetchData() async {
    Map<ItemCode, List<StatModel>> stats = {};
    /*
    * 이 반복문은 await를 하고있지 않으니까 병렬적으로 요청을 보내고 
    * 응답받은 순서대로 futures에 들어감
    */
    for(ItemCode itemCode in ItemCode.values){
      futures.add(StatRepository.fetchData(
        itemCode: itemCode
      ));
    }
    //futures에 값이 모두 들어갈때까지 await
    final results = await Future.wait(futures);
    for(int i=0;i<ItemCode.values.length;i++){
      final key = ItemCode.values[i];
      final value = results[i];
      stats.addAll({
        key: value,
      });
    }
    return stats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MainDrawer(
        selectedRegion: region,
        onRegionTap: (newregion) {
          setState(() {
            region = newregion;
          });
          Navigator.of(context).pop(); //지역이 눌린 뒤 Drqwer 치우기
        },
      ),
      body: FutureBuilder<Map<ItemCode, List<StatModel>>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //에러가 발생했을때
              return const Center(
                child: Text('에러가 발생하였습니다.'),
              );
            }
            if (!snapshot.hasData) {
              //로딩상태
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            Map<ItemCode, List<StatModel>> statData = snapshot.data!;
            StatModel pm10RecentStat = statData[ItemCode.PM10]![0];

            final status = DataUtils.getStatusFromItemCodeAndValue(
              value: pm10RecentStat.seoul,
              itemCode: ItemCode.PM10,
            );

            final ssModel = statData.keys.map((key) {
              final value = statData[key];
              final stat = value![0];

              return StatAndStatusModel(
                itemCode: key, 
                status: DataUtils.getStatusFromItemCodeAndValue(
                  value: stat.getLevelFromRegion(region), 
                  itemCode: key
                  ), 
                stat: stat
              );
            }).toList();

            return CustomScrollView(
              slivers: [
                MainAppBar(
                  stat: pm10RecentStat,
                  status: status,
                  region: region,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CategoryCard(models: ssModel, region: region,),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const HourlyCard(),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
