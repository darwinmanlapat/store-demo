import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:store_demo/feature/settings/presentation/screen/settings.dart';

class SettingsLocation extends BeamLocation<BeamState> {
  static const route = '/settings';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('settings'),
        name: 'Settings',
        title: 'Settings',
        child: SettingsScreen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
