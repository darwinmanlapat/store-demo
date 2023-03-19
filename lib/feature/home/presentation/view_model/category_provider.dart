import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/home/dependency_injection/dependency_injection.dart';
import 'package:store_demo/feature/home/domain/model/category_model.dart';
import 'package:store_demo/feature/home/domain/model/model.dart';
import 'package:store_demo/feature/home/domain/repository/repository.dart';

final categoryProvider = ProductCategoryStateNotifierProvider((ref) {
  final repository = ref.read(productRepositoryDI);

  return CategoryNotifier(
    repository: repository,
    ref: ref,
  );
});

class CategoryNotifier extends AsyncProductCategoryList {
  CategoryNotifier({
    AsyncValue<CategoryModel>? state,
    required this.repository,
    required this.ref,
  }) : super(state ?? const AsyncLoading());

  final ProductRepository repository;
  final Ref ref;

  Future<void> getProductCategories() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async => repository.getProductCategories(),
    );
  }
}

typedef AsyncProductCategoryList = StateNotifier<AsyncValue<CategoryModel>>;

typedef ProductCategoryStateNotifierProvider
    = StateNotifierProvider<CategoryNotifier, AsyncValue<CategoryModel>>;
