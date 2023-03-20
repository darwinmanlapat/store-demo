import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/common/route/locations/locations.dart';
import 'package:store_demo/feature/home/domain/model/model.dart';
import 'package:store_demo/feature/home/presentation/view_model/product_provider.dart';

class ProductsGridItem extends ConsumerWidget {
  const ProductsGridItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNotifier = ref.read(productProvider.notifier);

    return GestureDetector(
      onTap: () async {
        await productNotifier.getProductById(model.id);
        if (context.mounted) {
          Beamer.of(context, root: true).beamToNamed(ProductLocation.route);
        }
      },
      child: Opacity(
        opacity: 0.93,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: 140,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(model.image),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color(0x00404453),
                      Color(0xFF404453),
                    ],
                    stops: [
                      0.0,
                      1.0,
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 17,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _GridItemTitle(
                        title: model.title,
                      ),
                      _GridItemPrice(
                        price: model.price.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GridItemTitle extends StatelessWidget {
  const _GridItemTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Clear Sans',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.25,
      ),
      overflow: TextOverflow.ellipsis,
      softWrap: false,
    );
  }
}

class _GridItemPrice extends StatelessWidget {
  const _GridItemPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ $price',
      maxLines: 1,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Clear Sans',
        fontWeight: FontWeight.w700,
        fontSize: 12,
        letterSpacing: 0.8,
        height: 2,
      ),
      overflow: TextOverflow.ellipsis,
      softWrap: false,
    );
  }
}
