import 'package:store_demo/feature/home/data/remote/product_remote_source.dart';
import 'package:store_demo/feature/home/domain/model/category_model.dart';
import 'package:store_demo/feature/home/domain/model/product_model.dart';
import 'package:store_demo/feature/home/domain/repository/repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl({
    required ProductRemoteSource remoteSource,
  }) : _remoteSource = remoteSource;

  final ProductRemoteSource _remoteSource;

  @override
  Future<CategoryModel> getProductCategories() async {
    final result = await _remoteSource.getProductCategories();

    return result;
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String? category) async {
    final result = await _remoteSource.getProductsByCategory(category);

    return result;
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    final result = await _remoteSource.getProductById(id);

    return result;
  }
}
