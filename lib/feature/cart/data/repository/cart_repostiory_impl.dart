import 'package:store_demo/feature/cart/data/remote/remote.dart';
import 'package:store_demo/feature/cart/domain/model/model.dart';
import 'package:store_demo/feature/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  const CartRepositoryImpl({
    required CartRemoteSource remoteSource,
  }) : _remoteSource = remoteSource;

  final CartRemoteSource _remoteSource;

  @override
  Future<CartModel> getCart() async {
    final result = await _remoteSource.getCart();

    return result;
  }
}
