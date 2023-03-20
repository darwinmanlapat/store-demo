import 'package:store_demo/feature/cart/domain/model/model.dart';

abstract class CartRepository {
  Future<CartModel> getCart();
}
