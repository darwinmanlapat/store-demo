import 'package:flutter/material.dart';

@immutable
class CartProductsModel {
  final int productId;
  final int quantity;
  const CartProductsModel({
    required this.productId,
    required this.quantity,
  });

  CartProductsModel copyWith({
    int? productId,
    int? quantity,
  }) {
    return CartProductsModel(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }

  factory CartProductsModel.fromJson(Map<String, dynamic> json) {
    return CartProductsModel(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
    );
  }

  @override
  String toString() =>
      'CartProductsModel(productId: $productId, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartProductsModel &&
        other.productId == productId &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => productId.hashCode ^ quantity.hashCode;
}
