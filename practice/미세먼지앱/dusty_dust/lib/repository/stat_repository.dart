import 'package:dio/dio.dart';

import '../contant/data.dart';
import '../model/stat_model.dart';

class StatRepository {
  static Future<List<StatModel>> fetchData() async {
    final response = await Dio().get(
        'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst', //URL
        queryParameters: {
          'serviceKey': serviceKey,
          'returnType': 'json',
          'numOfRows': 30,
          'pageNo': 1,
          'itemCode': 'PM10',
          'dataGubun': 'HOUR',
          'searchCondition': 'WEEK'
        });
    return response.data['response']['body']['items']
        .map<StatModel>(
          //StatModel이라고 명시해주기
          (item) => StatModel.fromJson(json: item),
        )
        .toList();
  }
}
