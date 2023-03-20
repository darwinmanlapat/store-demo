import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/common/route/locations/locations.dart';
import 'package:store_demo/common/widget/widget.dart';
import 'package:store_demo/feature/login/presentation/component/component.dart';
import 'package:store_demo/feature/login/presentation/view_model/login_provider.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.read(loginProvider.notifier);
    final loginState = ref.watch(loginProvider);

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
                    if (loginState.loginError != null) ...[
                      const SizedBox(height: 24),
                      LoginErrorMessage(
                        message: loginState.loginError!,
                      )
                    ],
                    const SizedBox(height: 24),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LoginTextField(
                          keyboardType: TextInputType.text,
                          labelText: 'Username',
                          onChanged: loginNotifier.onUsernameChange,
                          inputText: loginState.username,
                        ),
                        const SizedBox(height: 16.0),
                        LoginTextField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          labelText: 'Password',
                          onChanged: loginNotifier.onPasswordChange,
                          inputText: loginState.password,
                        ),
                        const SizedBox(height: 16.0),
                        LoginButton(
                          label: 'Login',
                          isEmpty: loginState.password.isEmpty ||
                              loginState.username.isEmpty ||
                              loginState.isLoading,
                          isLoading: loginState.isLoading,
                          onPressed: () => loginNotifier.login(() {
                            Beamer.of(context)
                                .beamToNamed(HomeWrapperLocation.route);
                          }),
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
