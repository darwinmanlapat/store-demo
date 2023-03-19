import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:store_demo/feature/cart/presentation/screen/cart_screen.dart';

class CartLocation extends BeamLocation<BeamState> {
  static const route = '/cart';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('cart'),
        name: 'Cart',
        title: 'Cart',
        child: CartScreen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
