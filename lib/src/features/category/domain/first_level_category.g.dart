// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_level_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirstCategory _$FirstCategoryFromJson(Map<String, dynamic> json) =>
    FirstCategory(
      divisionId: json['divisionId'] as int,
      divisionName: json['divisionName'] as String?,
    );

Map<String, dynamic> _$FirstCategoryToJson(FirstCategory instance) =>
    <String, dynamic>{
      'divisionId': instance.divisionId,
      'divisionName': instance.divisionName,
    };

SecondLevelCategory _$SecondLevelCategoryFromJson(Map<String, dynamic> json) =>
    SecondLevelCategory(
      itemCategoryId: json['itemCategoryId'] as int,
      itemCategoryName: json['itemCategoryName'] as String?,
      divisionId: json['divisionId'] as int,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$SecondLevelCategoryToJson(
        SecondLevelCategory instance) =>
    <String, dynamic>{
      'itemCategoryId': instance.itemCategoryId,
      'itemCategoryName': instance.itemCategoryName,
      'divisionId': instance.divisionId,
      'imageUrl': instance.imageUrl,
    };

ThirdLevelCategory _$ThirdLevelCategoryFromJson(Map<String, dynamic> json) =>
    ThirdLevelCategory(
      productCategoryId: json['productCategoryId'] as int,
      productCategoryName: json['productCategoryName'] as String?,
      itemCategoryId: json['itemCategoryId'] as int,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ThirdLevelCategoryToJson(ThirdLevelCategory instance) =>
    <String, dynamic>{
      'productCategoryId': instance.productCategoryId,
      'productCategoryName': instance.productCategoryName,
      'itemCategoryId': instance.itemCategoryId,
      'imageUrl': instance.imageUrl,
    };
