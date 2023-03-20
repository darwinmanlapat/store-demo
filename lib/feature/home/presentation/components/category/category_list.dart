import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_demo/feature/home/presentation/components/category/category_list_item.dart';
import 'package:store_demo/feature/home/presentation/view_model/view_model.dart';

class CategoryList extends HookConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staticIndicator = [
      2,
      3,
      4,
      5,
      6,
    ];

    final isActiveIndex = useState(0);
    final staticItemNotifier = ref.read(staticItemProvider.notifier);
    final categoryStateProvider = ref.watch(categoryProvider);
    final categoryNotifier = ref.read(categoryProvider.notifier);

    return categoryStateProvider.when(
      data: (data) {
        final categoryList = data.categories;
        final itemCount = categoryList.length;

        return SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              final isActive = isActiveIndex.value == index;
              return CategoryListItem(
                text: categoryList[index],
                marginLeft: index == 0 ? 24.0 : 8.0,
                marginRight: index == 4 ? 24.0 : 8.0,
                onTap: () {
                  isActiveIndex.value = index;
                  staticItemNotifier.onChanged(staticIndicator[index]);
                  categoryNotifier.setCategory(categoryList[index]);
                },
                isActive: isActive,
              );
            },
          ),
        );
      },
      error: (e, s) => const Center(
        child: Text('Something went wrong. Please try again.'),
      ),
      loading: () {
        return SizedBox(
          height: 50,
          child: Shimmer.fromColors(
            baseColor: const Color(0xFFE8E8E8),
            highlightColor: const Color(0xFFEEEEEE),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                  margin: EdgeInsets.only(
                    left: index == 0 ? 24.0 : 8.0,
                    right: index == 4 ? 24.0 : 8.0,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
