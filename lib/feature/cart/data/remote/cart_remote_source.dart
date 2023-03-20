import 'package:dio/dio.dart';
import 'package:store_demo/feature/cart/domain/model/cart_model.dart';

class CartRemoteSource {
  const CartRemoteSource({
    required Dio httpClient,
  }) : _httpClient = httpClient;

  final Dio _httpClient;

  Future<CartModel> getCart() async {
    try {
      final response =
          await _httpClient.get('https://fakestoreapi.com/carts/user/1',
              options: Options(
                contentType: Headers.formUrlEncodedContentType,
              ));

      final data =
          (response.data as List<dynamic>).cast<Map<String, dynamic>>();
      final cartData = CartModel.fromJson(data[0]);

      return cartData;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
