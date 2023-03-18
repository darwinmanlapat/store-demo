import 'package:flutter/material.dart';

class LoginErrorMessage extends StatelessWidget {
  const LoginErrorMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFFF8D8F),
      ),
      child: Align(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Clear Sans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            height: 1.714,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
