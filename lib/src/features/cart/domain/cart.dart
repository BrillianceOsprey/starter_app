// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:starter_app/src/features/product/domain/product.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart extends Equatable {
  Cart(this.id, this.productCode, this.quantity, this.variantId, this.product,
      this.variant);

  final int id;
  final String productCode;
  final int quantity;
  final String? variantId;
  final Product product;
  final String? variant;

  @override
  List<Object?> get props => [id];

  @override
  bool get stringify => true;

  Cart copyWith({
    int? id,
    String? productCode,
    int? quantity,
    String? variantId,
    Product? product,
    String? variant,
  }) {
    return Cart(
      id ?? this.id,
      productCode ?? this.productCode,
      quantity ?? this.quantity,
      variantId ?? this.variantId,
      product ?? this.product,
      variant ?? this.variant,
    );
  }
}
