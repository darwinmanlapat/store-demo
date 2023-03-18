import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/common/widget/widget.dart';
import 'package:store_demo/feature/login/presentation/component/component.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(16)),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  color: const Color(0xFF404453),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Image.asset('assets/shopping-cart.png'),
                      ),
                      const SizedBox(height: 24.0),
                      const GradientText(
                        'Ecommerce Store',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                        gradient: LinearGradient(colors: [
                          Color(0xFF36CFA2),
                          Color(0xFF05B89D),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GradientText(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      gradient: LinearGradient(colors: [
                        Color(0xFF404453),
                        Color(0xFF404453),
                      ]),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LoginTextField(
                          keyboardType: TextInputType.text,
                          labelText: 'Username',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16.0),
                        LoginTextField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          labelText: 'Password',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16.0),
                        const LoginButton(
                          label: 'Login',
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
