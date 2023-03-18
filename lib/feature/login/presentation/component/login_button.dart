import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginButton extends HookWidget {
  const LoginButton(
      {required this.label,
      this.onPressed,
      this.width,
      this.height,
      this.isLoading,
      this.isEmpty,
      super.key});

  final String label;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final bool? isLoading;
  final bool? isEmpty;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ?? false ? null : onPressed,
      child: SizedBox(
        width: width,
        height: height ?? 48,
        child: Opacity(
          opacity: isEmpty ?? isLoading ?? false ? 0.5 : 1,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              gradient: LinearGradient(
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset(1.75, 0.5),
                colors: [
                  Color(0xFF36CFA2),
                  Color(0xFF05B89D),
                ],
              ),
            ),
            child: Align(
              child: isLoading ?? false
                  ? const SizedBox(
                      height: 14,
                      width: 14,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFFFFFFF),
                        ),
                      ),
                    )
                  : Text(
                      label,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xFFFFFFFF),
                      ),
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
