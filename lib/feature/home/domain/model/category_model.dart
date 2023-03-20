import 'package:flutter/material.dart';

@immutable
class CategoryModel {
  final List<String> categories;
  final String? selectedCategory;

  const CategoryModel({
    required this.categories,
    this.selectedCategory,
  });

  const CategoryModel.initial()
      : categories = const [],
        selectedCategory = '';

  CategoryModel copyWith({
    List<String>? categories,
    String? selectedCategory,
  }) {
    return CategoryModel(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.categories == categories &&
        other.selectedCategory == selectedCategory;
  }

  @override
  int get hashCode {
    return categories.hashCode ^ selectedCategory.hashCode;
  }

  @override
  String toString() {
    return 'CategoryModel(categories: $categories, selectedCategory: $selectedCategory)';
  }
}
