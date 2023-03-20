import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/cart/dependency_injection/cart_repository.di.dart';
import 'package:store_demo/feature/cart/domain/model/cart_model.dart';
import 'package:store_demo/feature/cart/domain/repository/cart_repository.dart';
import 'package:store_demo/feature/home/domain/model/model.dart';
import 'package:store_demo/feature/home/presentation/view_model/view_model.dart';

final cartProvider = CartStateNotifierProvider((ref) {
  final repository = ref.read(cartRepositoryDI);

  return CartNotifier(
    repository: repository,
    ref: ref,
  );
});

class CartNotifier extends AsyncCart {
  CartNotifier({
    AsyncValue<CartModel>? state,
    required this.repository,
    required this.ref,
  }) : super(state ?? const AsyncLoading());

  final CartRepository repository;
  final Ref ref;

  Future<void> getCart() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async => repository.getCart(),
    );

    final cartProducts = state.asData!.value.products;
    final productNotifier = ref.read(productProvider.notifier);

    final products = cartProducts.map((cart) async {
      final product = await productNotifier.getProductById(cart.productId);
      return product;
    });

    List<ProductModel> parsedProducts =
        await Future.wait(products).then((product) {
      return product.whereType<ProductModel>().toList();
    });

    state = AsyncData(
      state.requireValue.copyWith(parsedProducts: parsedProducts),
    );
  }
}

typedef AsyncCart = StateNotifier<AsyncValue<CartModel>>;

typedef CartStateNotifierProvider
    = StateNotifierProvider<CartNotifier, AsyncValue<CartModel>>;
