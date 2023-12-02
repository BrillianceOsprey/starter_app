import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginate.g.dart';

/// Generic paginatation model
///
/// Usage:
/// ```dart
/// return PaginatedResponse<Product>.fromJson(
///     response.data,
///     (json) => Product.fromJson(json! as Map<String, dynamic>),
/// );
/// ```
@JsonSerializable(
  explicitToJson: true,
  genericArgumentFactories: true,
  createToJson: false,
)
class PaginatedResponse<T> extends Equatable {
  static const int defaultItemPerPage = 10;

  const PaginatedResponse({
    required this.totalCount,
    required this.page,
    required this.limit,
    required this.totalPage,
    required this.totalGroupCount,
    required this.data,
    this.meta,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);

  /// Total data length.
  @JsonKey(name: 'total_count', defaultValue: 0)
  final int totalCount;

  /// Current page number.
  @JsonKey(name: 'page', defaultValue: 0)
  final int page;

  /// Item limit per page.
  @JsonKey(name: 'limit', defaultValue: 0)
  final int limit;

  /// Total page available.
  @JsonKey(name: 'total_page', defaultValue: 0)
  final int totalPage;

  /// Total group count.
  @JsonKey(name: 'total_group_count', defaultValue: 0)
  final int totalGroupCount;

  /// Current page data
  ///
  /// * must be object [List]
  @JsonKey(defaultValue: [])
  final List<T> data;

  final MetaData? meta;

  /// Flag to check there is next page available.
  bool get hasNext => page < totalPage;

  bool get isCompleted => page >= totalPage;
  bool get isCompletedByMeta =>
      meta != null ? meta!.page >= meta!.totalPage : false;

  PaginationRequest nextPage() =>
      PaginationRequest(page: page + 1, limit: limit);

  @override
  List<Object?> get props => [
        page,
        limit,
        totalCount,
        totalPage,
        totalGroupCount,
        data,
      ];

  @override
  bool? get stringify => true;
}

@JsonSerializable()
class MetaData {
  const MetaData({
    required this.page,
    required this.perPage,
    required this.totalPage,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);

  final int page;
  final int perPage;
  final int totalPage;
}

@JsonSerializable()
class PaginationRequest extends Equatable {
  const PaginationRequest({required this.page, required this.limit});

  factory PaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$PaginationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRequestToJson(this);

  final int page;
  final int limit;

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
