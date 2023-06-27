import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagnation_model.g.dart';

@JsonSerializable(
  genericArgumentFactories: true
)
class CursorPagination<T>{
  final CursorPagnationMeta meta;
  List<T> data;

  CursorPagination({
    required this.meta,
    required this.data
  });

  //T type의 객체 리스트를 직렬화 할때 사용 genericArgumentFactories : true로 지정
  //fomJson의 변수 추가
  factory CursorPagination.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT)
  => _$CursorPaginationFromJson(json, fromJsonT);
}

@JsonSerializable()
class CursorPagnationMeta{
  final int count;
  final bool hasMore;

  CursorPagnationMeta({
    required this.count,
    required this.hasMore,
  });

  factory CursorPagnationMeta.fromJson(Map<String, dynamic> json)
  => _$CursorPagnationMetaFromJson(json);
}