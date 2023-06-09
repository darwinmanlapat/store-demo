import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:store_demo/feature/login/presentation/screen/login_screen.dart';

class LoginLocation extends BeamLocation<BeamState> {
  static const route = '/login';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('login'),
        name: 'Login',
        title: 'Login',
        child: LoginScreen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
