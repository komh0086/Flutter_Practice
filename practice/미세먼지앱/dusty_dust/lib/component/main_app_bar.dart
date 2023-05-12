import 'package:flutter/material.dart';

import '../model/stat_model.dart';
import '../model/status_model.dart';
import '../utils/data_utils.dart';

class MainAppBar extends StatelessWidget {
  final String region; //지역
  final StatusModel status; //stat에 맞는 Status
  final StatModel stat; //공개 API로 받아온 실제 상태

  const MainAppBar({super.key, required this.stat, required this.status, required this.region});

  final ts = const TextStyle(
    //자주 쓰는 스타일 정의
    color: Colors.white,
    fontSize: 30,
  );

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 500, //높이 늘리기
      backgroundColor: status.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: kToolbarHeight), //앱바의 높이만큼 margin 생성
            child: Column(
              children: [
                Text(region,
                    style: ts.copyWith(
                      color: status.detailFontColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: 20),
                Text(
                  DataUtils.getTimeFromDateTime(dateTime: stat.dataTime),
                  style: ts.copyWith(
                    color: status.detailFontColor,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  status.imgPath,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(height: 20),
                Text(status.label,
                    style: ts.copyWith(
                      color: status.detailFontColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: 8),
                Text(status.comment,
                    style: ts.copyWith(
                      color: status.detailFontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
