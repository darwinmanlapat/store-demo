import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/common/widget/widget.dart';
import 'package:store_demo/feature/home/presentation/view_model/view_model.dart';

class ProductScreen extends HookConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productStateProvider = ref.watch(productProvider);
    final isButtonClicked = useState(false);

    return productStateProvider.when(
      data: (data) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 340,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(data.image),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 15,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                        color: const Color(0xFF404453),
                        onPressed: () => Beamer.of(context).beamBack(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.title,
                                      style: const TextStyle(
                                        fontFamily: 'Clear Sans',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF404453),
                                      ),
                                    ),
                                    Text(
                                      data.category,
                                      style: const TextStyle(
                                        fontFamily: 'Clear Sans',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF05B89D),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade700,
                                    ),
                                    Text(
                                      '${data.rating['rate'].toString()} (${data.rating['count']})',
                                      style: const TextStyle(
                                        fontFamily: 'Clear Sans',
                                        color: Color(0x80404453),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontFamily: 'Clear Sans',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF404453),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data.description,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontFamily: 'Clear Sans',
                              color: Color(0xFF404453),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  color: const Color(0xFF404453),
                  child: CustomButton(
                    label: 'Add to cart',
                    isLoading: isButtonClicked.value,
                    onPressed: () {
                      isButtonClicked.value = true;

                      Timer(const Duration(seconds: 1), () {
                        isButtonClicked.value = false;
                        const snackBar = SnackBar(
                          content: Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Text('Item added to cart'),
                          ),
                          backgroundColor: Color(0xFF404453),
                          showCloseIcon: true,
                          closeIconColor: Color(0xFF05B89D),
                          duration: Duration(milliseconds: 500),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
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
