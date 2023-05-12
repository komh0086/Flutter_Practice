import 'package:dusty_dust/component/main_card.dart';
import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';

import '../contant/main_stat.dart';
import '../model/stat_and_status_model.dart';
import 'card_title.dart';

class CategoryCard extends StatelessWidget {
  final String region;
  final List<StatAndStatusModel> models;

  const CategoryCard({super.key, required this.region, required this.models});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: MainCard(
        child: LayoutBuilder(builder: (context, constraint) {
          //constraint변수를 통해 상위 위젯의 사이즈를 가져올 수 있음
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CardTitle(title: '종류별 통계'),
              Expanded(
                child: ListView(
                  physics: const PageScrollPhysics(), //페이지가 넘어가듯이 스크롤
                  scrollDirection:
                      Axis.horizontal, //가로로 리스트 뷰를 스크롤한다. 높이 지정을 해야함
                  children: models.map(
                    (model) => MainStat(
                      category: DataUtils.getItemCodeKrString(itemCode: model.itemCode),
                      width: constraint.maxWidth/3,
                      imgPath: model.status.imgPath,
                      level: model.status.label,
                      stat: '${model.stat.getLevelFromRegion(
                        region
                        )}${DataUtils.getUnitFromItemCode(itemCode: model.itemCode)}',
                      )
                    ).toList(),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
