import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:store_demo/feature/home/presentation/screen/screen.dart';

class HomeWrapperLocation extends BeamLocation<BeamState> {
  static const route = '/home-wrapper';
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey('home-wrapper'),
        name: 'Home Wrapper',
        title: 'Home Wrapper',
        child: HomeWrapperScreen(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [route];
}
