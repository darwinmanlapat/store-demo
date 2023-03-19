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
}
