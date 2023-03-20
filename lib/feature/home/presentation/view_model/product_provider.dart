import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/home/dependency_injection/dependency_injection.dart';
import 'package:store_demo/feature/home/domain/model/model.dart';
import 'package:store_demo/feature/home/domain/repository/repository.dart';

final productProvider = ProductStateNotifierProvider((ref) {
  final repository = ref.read(productRepositoryDI);

  return ProductNotifier(
    repository: repository,
    ref: ref,
  );
});

class ProductNotifier extends AsyncProduct {
  ProductNotifier({
    AsyncValue<ProductModel>? state,
    required this.repository,
    required this.ref,
  }) : super(state ?? const AsyncLoading());

  final ProductRepository repository;
  final Ref ref;

  Future<void> getProductById(int id) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async => repository.getProductById(id),
    );
  }
}

typedef AsyncProduct = StateNotifier<AsyncValue<ProductModel>>;

typedef ProductStateNotifierProvider
    = StateNotifierProvider<ProductNotifier, AsyncValue<ProductModel>>;
