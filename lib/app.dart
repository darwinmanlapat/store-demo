import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:store_demo/common/route/locations/locations.dart';

import 'common/route/route.dart';

class StoreApp extends HookWidget {
  const StoreApp({super.key});

  static final _routerDelegate = useMemoized(() {
    return BeamerDelegate(
      initialPath: LoginLocation.route,
      locationBuilder: locationBuilder);
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}
