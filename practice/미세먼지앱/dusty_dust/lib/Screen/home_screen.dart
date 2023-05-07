import 'package:dusty_dust/component/category_card.dart';
import 'package:dusty_dust/component/hourl_card.dart';
import 'package:dusty_dust/contant/colors.dart';
import 'package:dusty_dust/contant/regions.dart';
import 'package:dusty_dust/repository/stat_repository.dart';
import 'package:flutter/material.dart';

import '../component/main_app_bar.dart';
import '../component/main_drawer.dart';
import '../model/stat_model.dart';
import '../utils/data_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String region = regions[0];

  Future<List<StatModel>> fetchData() async {
    final statModels = await StatRepository.fetchData();

    return statModels;
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
      body: FutureBuilder<List<StatModel>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //에러가 발생했을때
              print(snapshot.error);
              return Center(
                child: Text('에러가 발생하였습니다.'),
              );
            }
            if (!snapshot.hasData) {
              //로딩상태
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<StatModel> statData = snapshot.data!;
            StatModel recentStat = statData[0];

            final status = DataUtils.getStatusFromItemCodeAndValue(
              value: recentStat.seoul,
              itemCode: ItemCode.PM10,
            );

            return CustomScrollView(
              slivers: [
                MainAppBar(
                  stat: recentStat,
                  status: status,
                  region: region,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CategoryCard(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      hourlyCard(),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
