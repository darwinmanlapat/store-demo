import 'package:flutter/foundation.dart';
import 'package:store_demo/feature/cart/domain/model/cart_products_model.dart';
import 'package:store_demo/feature/home/domain/model/model.dart';

@immutable
class CartModel {
  final int id;
  final String date;
  final List<CartProductsModel> products;
  final List<ProductModel>? parsedProducts;

  const CartModel(
      {required this.id,
      required this.date,
      required this.products,
      this.parsedProducts});

  CartModel copyWith({
    int? id,
    String? date,
    List<CartProductsModel>? products,
    List<ProductModel>? parsedProducts,
  }) {
    return CartModel(
      id: id ?? this.id,
      date: date ?? this.date,
      products: products ?? this.products,
      parsedProducts: parsedProducts ?? this.parsedProducts,
    );
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final products =
        (json['products'] as List<dynamic>).cast<Map<String, dynamic>>();

    return CartModel(
      id: json['id'] as int,
      date: json['date'] as String,
      products: List<CartProductsModel>.from(
        products.map<CartProductsModel>(CartProductsModel.fromJson),
      ),
    );
  }

  @override
  String toString() =>
      'CartModel(id: $id, date: $date, products: $products, parsedProducts: $parsedProducts)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel &&
        other.id == id &&
        other.date == date &&
        listEquals(other.products, products) &&
        listEquals(other.parsedProducts, parsedProducts);
  }

  @override
  int get hashCode =>
      id.hashCode ^ date.hashCode ^ products.hashCode ^ parsedProducts.hashCode;
}
