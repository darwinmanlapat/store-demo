import 'package:store_demo/feature/home/domain/model/model.dart';

abstract class ProductRepository {
  Future<CategoryModel> getProductCategories();
}
