import 'package:flutter/material.dart';

@immutable
class CategoryModel {
  const CategoryModel({
    required this.categories,
  });

  const CategoryModel.initial() : categories = const [];

  final List<String> categories;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel && other.categories == categories;
  }

  @override
  int get hashCode {
    return categories.hashCode;
  }

  @override
  String toString() {
    return 'CategoryModel(categories: $categories)';
  }
}
