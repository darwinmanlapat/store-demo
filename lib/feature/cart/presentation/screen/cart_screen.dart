import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/cart/presentation/component/cart_list.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Your Cart',
          style: TextStyle(
            fontFamily: 'Clear Sans',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Color(0xFF404453),
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              CartList(),
            ],
          ),
        ),
      ),
    );
  }
}
