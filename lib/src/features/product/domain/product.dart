// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final String productCode;
  final String erpCode;
  final String productName;
  final String price;
  final String imageUrl;
  @JsonKey(name: 'variants', defaultValue: [])
  final List<String> variants;
  const Product({
    required this.productCode,
    required this.erpCode,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.variants,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Product copyWith({
    String? productCode,
    String? erpCode,
    String? productName,
    String? price,
    String? imageUrl,
    List<String>? variants,
  }) {
    return Product(
      productCode: productCode ?? this.productCode,
      erpCode: erpCode ?? this.erpCode,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      variants: variants ?? this.variants,
    );
  }

  @override
  List<Object?> get props => [productCode];
}
//    "productCode": "P17676",
//   "erpCode": "SHKUFG038",
//   "productName": "FOOD STREAMER PLATE အစားအပေါင်းခံပြား( 17CM)",
//   "price": 3800,
//   "imageUrl": null,
//   "variants": []
