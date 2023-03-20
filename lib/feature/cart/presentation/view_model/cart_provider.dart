import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/cart/dependency_injection/cart_repository.di.dart';
import 'package:store_demo/feature/cart/domain/model/cart_model.dart';
import 'package:store_demo/feature/cart/domain/repository/cart_repository.dart';

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
  }
}

typedef AsyncCart = StateNotifier<AsyncValue<CartModel>>;

typedef CartStateNotifierProvider
    = StateNotifierProvider<CartNotifier, AsyncValue<CartModel>>;
