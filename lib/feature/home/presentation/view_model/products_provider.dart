import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/home/dependency_injection/dependency_injection.dart';
import 'package:store_demo/feature/home/domain/model/model.dart';
import 'package:store_demo/feature/home/domain/repository/repository.dart';
import 'package:store_demo/feature/home/presentation/view_model/view_model.dart';

final productsProvider = ProductsStateNotifierProvider((ref) {
  final repository = ref.read(productRepositoryDI);

  return ProductsNotifier(
    repository: repository,
    ref: ref,
  );
});

class ProductsNotifier extends AsyncProductsList {
  ProductsNotifier({
    AsyncValue<List<ProductModel>>? state,
    required this.repository,
    required this.ref,
  }) : super(state ?? const AsyncLoading());

  final ProductRepository repository;
  final Ref ref;

  Future<void> getProductsByCategory() async {
    state = const AsyncLoading();
    final categoryStateProvider = ref.read(categoryProvider);
    final category = categoryStateProvider.asData?.value.selectedCategory;

    state = await AsyncValue.guard(
      () async => repository.getProductsByCategory(category),
    );
  }
}

typedef AsyncProductsList = StateNotifier<AsyncValue<List<ProductModel>>>;

typedef ProductsStateNotifierProvider
    = StateNotifierProvider<ProductsNotifier, AsyncValue<List<ProductModel>>>;
