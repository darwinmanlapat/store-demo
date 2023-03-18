import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:store_demo/feature/login/presentation/screen/login_screen.dart';

class LoginLocation extends BeamLocation<BeamState> {
  static const key = 'login';
  static const name = 'Login';
  static const title = 'Login';

  static const route = '/login';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
          key: ValueKey(key), name: name, title: title, child: LoginScreen())
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
