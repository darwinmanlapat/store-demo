import 'package:dio/dio.dart';
import 'package:store_demo/feature/home/domain/model/model.dart';

class ProductRemoteSource {
  const ProductRemoteSource({
    required Dio httpClient,
  }) : _httpClient = httpClient;

  final Dio _httpClient;

  Future<CategoryModel> getProductCategories() async {
    try {
      final response =
          await _httpClient.get('https://fakestoreapi.com/products/categories',
              options: Options(
                contentType: Headers.formUrlEncodedContentType,
              ));

      final data = (response.data as List<dynamic>).cast<String>();
      data.insert(0, "all");
      final categories = CategoryModel(categories: data);

      return categories;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String? category) async {
    try {
      String route = '';

      if (category != null) {
        route = 'category/$category';
      }

      if (category == 'all') {
        route = '';
      }

      final response =
          await _httpClient.get('https://fakestoreapi.com/products/$route',
              options: Options(
                contentType: Headers.formUrlEncodedContentType,
              ));

      final data = response.data as List<dynamic>;
      final values = data.map(
        (dynamic item) => ProductModel.fromJson(item as Map<String, dynamic>),
      );

      return values.toList();
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductModel> getProductById(int id) async {
    try {
      final response =
          await _httpClient.get('https://fakestoreapi.com/products/$id',
              options: Options(
                contentType: Headers.formUrlEncodedContentType,
              ));

      final data = response.data as Map<String, dynamic>;
      final values = ProductModel.fromJson(data);

      return values;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
