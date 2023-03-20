import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CartScreen extends HookWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Cart',
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
            children: const [],
          ),
        ),
      ),
    );
  }
}
