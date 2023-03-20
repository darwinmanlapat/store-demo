import 'package:store_demo/feature/home/domain/model/model.dart';

abstract class ProductRepository {
  Future<CategoryModel> getProductCategories();

  Future<List<ProductModel>> getProductsByCategory(String? category);

  Future<ProductModel> getProductById(int id);
}
