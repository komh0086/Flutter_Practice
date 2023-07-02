import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagnation_model.g.dart';

abstract class CursorPaginationBase{}

//에러가 났을 때
class CursorPaginationError extends CursorPaginationBase{
  final String message;

  CursorPaginationError({
    required this.message,
  });
}

//요청을 불러오고 있을 떄
class CursorPaginationLoading extends CursorPaginationBase{}

//기본 상태
@JsonSerializable(
  genericArgumentFactories: true
)
class CursorPagination<T> extends CursorPaginationBase{
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

//새로고침 할때
class CursorPaginationRefetching<T> extends CursorPagination<T>{
  CursorPaginationRefetching({
    required super.meta, 
    required super.data
    });
}

//리스트의 맨 아래로 내려서
//추가 데이터를 요청하는 중일 때
class CursorPaginationFetchingMore<T> extends CursorPagination<T>{
  CursorPaginationFetchingMore({
    required super.meta, 
    required super.data
    });
}