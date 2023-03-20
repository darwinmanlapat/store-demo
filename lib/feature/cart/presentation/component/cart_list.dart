import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/cart/presentation/component/cart_list_item.dart';
import 'package:store_demo/feature/cart/presentation/view_model/view_model.dart';

class CartList extends HookConsumerWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.read(cartProvider.notifier);
    final cartStateProvider = ref.watch(cartProvider);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await cartNotifier.getCart();
        });
        return null;
      },
      [],
    );

    return cartStateProvider.when(
      data: (data) {
        return ListView.builder(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: data.parsedProducts?.length,
          itemBuilder: (context, index) {
            return CartListItem(
              onTap: () {},
              title: data.parsedProducts?[index].title ?? '',
              subtitle: data.parsedProducts?[index].category ?? '',
              description: data.parsedProducts?[index].description ?? '',
              photoURL: data.parsedProducts?[index].image ??
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
            );
          },
        );
      },
      error: (e, s) => const Center(
        child: Text('Something went wrong. Please try again.'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF05B89D),
        ),
      ),
    );
  }
}
