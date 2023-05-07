import 'package:flutter/material.dart';

class StatusModel {
  final int level; //단계

  final String label; //단계 이름

  final Color primaryColor; //주 색상

  final Color darkColor; //어두운 색상

  final Color lightColor; // 밝은 색상

  final Color detailFontColor; //폰트 색상

  final String imgPath; // 이미지 경로

  final String comment; //코멘트

  final double minFindDust; //미세먼지 최소치

  final double minUltraFinDust; //초미세먼지 최소치

  final double minO3; //오존 최소치

  final double minCO; //일산화탄초 최소치

  final double minNO2; //이산화질소 최소치

  final double minSO2; // 이황산가스 최소치

  StatusModel(
      {required this.minSO2,
      required this.comment,
      required this.darkColor,
      required this.detailFontColor,
      required this.imgPath,
      required this.label,
      required this.level,
      required this.lightColor,
      required this.minFindDust,
      required this.minNO2,
      required this.minO3,
      required this.minUltraFinDust,
      required this.primaryColor,
      required this.minCO});
}
