import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:store_demo/feature/home/presentation/screen/screen.dart';

class HomeLocation extends BeamLocation<BeamState> {
  static const route = '/home';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('home'),
        name: 'Home',
        title: 'Home',
        child: HomeScreen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
