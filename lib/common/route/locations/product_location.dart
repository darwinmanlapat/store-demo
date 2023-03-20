import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:store_demo/common/route/locations/locations.dart';
import 'package:store_demo/feature/home/presentation/screen/screen.dart';

class ProductLocation extends BeamLocation<BeamState> {
  static const route = '/product';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('product'),
        name: 'Product',
        title: 'Product',
        popToNamed: HomeWrapperLocation.route,
        child: ProductScreen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
