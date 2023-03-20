import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/home/presentation/components/category/category_list.dart';
import 'package:store_demo/feature/home/presentation/components/product/product.dart';
import 'package:store_demo/feature/home/presentation/view_model/view_model.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryNotifier = ref.read(categoryProvider.notifier);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await categoryNotifier.getProductCategories();
        });
        return null;
      },
      [],
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 240,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/woman-with-shopping-bags.jpg'),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xB3404453),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0x4D404453),
                    Color(0xB3404453),
                  ])),
                ),
              ),
              const Positioned(
                left: 24,
                right: 0,
                top: 100,
                child: Text(
                  'SHOP NOW',
                  style: TextStyle(
                    fontFamily: 'Clear Sans',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: CategoryList(),
              )
            ],
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ProductsGrid(),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
