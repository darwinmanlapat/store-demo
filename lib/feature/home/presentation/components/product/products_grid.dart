import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_demo/feature/home/presentation/components/product/products_grid_item.dart';
import 'package:store_demo/feature/home/presentation/view_model/view_model.dart';

class ProductsGrid extends HookConsumerWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsNotifier = ref.read(productsProvider.notifier);
    final productsStateProvider = ref.watch(productsProvider);
    final categoryStateProvider = ref.watch(categoryProvider);
    final category = categoryStateProvider.asData?.value.selectedCategory;

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await productsNotifier.getProductsByCategory();
        });
        return null;
      },
      [category],
    );

    return productsStateProvider.when(
        data: (data) {
          final productList = data;

          return MasonryGridView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: productList.length,
            mainAxisSpacing: 1,
            crossAxisSpacing: 16,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return ProductsGridItem(
                model: productList[index],
              );
            },
          );
        },
        error: (e, s) => const Center(
              child: Text('Something went wrong. Please try again.'),
            ),
        loading: () {
          return Shimmer.fromColors(
            baseColor: const Color(0xFFE8E8E8),
            highlightColor: const Color(0xFFEEEEEE),
            child: MasonryGridView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              mainAxisSpacing: 1,
              crossAxisSpacing: 16,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: 140,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey,
                  ),
                  margin: const EdgeInsets.only(bottom: 16),
                );
              },
            ),
          );
        });
  }
}
