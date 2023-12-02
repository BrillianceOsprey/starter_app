// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'first_level_category.g.dart';

typedef DivisionID = int;

@JsonSerializable()
class FirstCategory extends Equatable {
  const FirstCategory({required this.divisionId, required this.divisionName});

  final DivisionID divisionId;
  final String? divisionName;

  factory FirstCategory.fromJson(Map<String, dynamic> json) =>
      _$FirstCategoryFromJson(json);

  @override
  List<Object?> get props => [divisionId, divisionName];

  @override
  bool? get stringify => true;

  FirstCategory copyWith({
    DivisionID? divisionId,
    String? divisionName,
  }) {
    return FirstCategory(
      divisionId: divisionId ?? this.divisionId,
      divisionName: divisionName ?? this.divisionName,
    );
  }
}

@JsonSerializable()
class SecondLevelCategory extends Equatable {
  SecondLevelCategory({
    required this.itemCategoryId,
    required this.itemCategoryName,
    required this.divisionId,
    required this.imageUrl,
  });

  final int itemCategoryId;
  final String? itemCategoryName;
  final DivisionID divisionId;
  final String? imageUrl;
  factory SecondLevelCategory.fromJson(Map<String, dynamic> json) =>
      _$SecondLevelCategoryFromJson(json);
  @override
  List<Object?> get props => [divisionId];
  @override
  bool? get stringify => true;

  SecondLevelCategory copyWith({
    int? itemCategoryId,
    String? itemCategoryName,
    DivisionID? divisionId,
    String? imageUrl,
  }) {
    return SecondLevelCategory(
      itemCategoryId: itemCategoryId ?? this.itemCategoryId,
      itemCategoryName: itemCategoryName ?? this.itemCategoryName,
      divisionId: divisionId ?? this.divisionId,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

@JsonSerializable()
class ThirdLevelCategory extends Equatable {
  ThirdLevelCategory({
    required this.productCategoryId,
    required this.productCategoryName,
    required this.itemCategoryId,
    required this.imageUrl,
  });

  final int productCategoryId;
  final String? productCategoryName;
  final DivisionID itemCategoryId;
  final String? imageUrl;
  factory ThirdLevelCategory.fromJson(Map<String, dynamic> json) =>
      _$ThirdLevelCategoryFromJson(json);
  @override
  List<Object?> get props => [productCategoryId];
  @override
  bool? get stringify => true;

  ThirdLevelCategory copyWith({
    int? productCategoryId,
    String? productCategoryName,
    DivisionID? itemCategoryId,
    String? imageUrl,
  }) {
    return ThirdLevelCategory(
      productCategoryId: productCategoryId ?? this.productCategoryId,
      productCategoryName: productCategoryName ?? this.productCategoryName,
      itemCategoryId: itemCategoryId ?? this.itemCategoryId,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
