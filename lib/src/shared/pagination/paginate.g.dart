// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedResponse<T>(
      totalCount: json['total_count'] as int? ?? 0,
      page: json['page'] as int? ?? 0,
      limit: json['limit'] as int? ?? 0,
      totalPage: json['total_page'] as int? ?? 0,
      totalGroupCount: json['total_group_count'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
      meta: json['meta'] == null
          ? null
          : MetaData.fromJson(json['meta'] as Map<String, dynamic>),
    );

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      page: json['page'] as int,
      perPage: json['perPage'] as int,
      totalPage: json['totalPage'] as int,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'totalPage': instance.totalPage,
    };

PaginationRequest _$PaginationRequestFromJson(Map<String, dynamic> json) =>
    PaginationRequest(
      page: json['page'] as int,
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$PaginationRequestToJson(PaginationRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
