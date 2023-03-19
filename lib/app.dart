import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/common/route/locations/locations.dart';
import 'package:store_demo/common/service/service.dart';

import 'common/route/route.dart';

class StoreApp extends HookConsumerWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated =
        ref.read(localStorageServiceProvider.notifier).getAuthentication();

    final routerDelegate = useMemoized(() {
      return BeamerDelegate(
        initialPath:
            isAuthenticated ?? false ? HomeWrapperLocation.route : LoginLocation.route,
        locationBuilder: rootLocationBuilder,
        transitionDelegate: const NoAnimationTransitionDelegate(),
        beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
        guards: [
          BeamGuard(
            pathPatterns: [
              HomeLocation.route,
            ],
            check: (context, location) {
              final container = ProviderScope.containerOf(context);
              final isAuthenticated = container
                  .read(localStorageServiceProvider.notifier)
                  .getAuthentication();

              return isAuthenticated ?? false;
            },
            beamToNamed: (origin, target) => LoginLocation.route,
          ),
        ],
      );
    });

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}
