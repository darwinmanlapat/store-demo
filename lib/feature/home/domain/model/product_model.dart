class ProductModel {
  final int id;
  final String title;
  final String category;
  final String description;
  final String image;
  final dynamic price;
  final Map<String, dynamic> rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    String? category,
    String? description,
    String? image,
    dynamic price,
    Map<String, dynamic>? rating,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      rating: rating ?? this.rating,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      category: map['category'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as dynamic,
      rating: map['rating'] as Map<String, dynamic>,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, category: $category, description: $description, image: $image, price: $price, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.title == title &&
        other.category == category &&
        other.description == description &&
        other.image == image &&
        other.price == price &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        category.hashCode ^
        description.hashCode ^
        image.hashCode ^
        price.hashCode ^
        rating.hashCode;
  }
}
