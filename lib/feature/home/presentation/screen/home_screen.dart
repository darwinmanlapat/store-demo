import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/home/presentation/components/category/category_list.dart';
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
            children: const [
              SizedBox(
                width: double.infinity,
                height: 240,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFF404453),
                  ),
                ),
              ),
              Positioned(
                left: 24,
                right: 0,
                top: 80,
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
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: CategoryList(),
              )
            ],
          )
        ],
      ),
    );
  }
}
