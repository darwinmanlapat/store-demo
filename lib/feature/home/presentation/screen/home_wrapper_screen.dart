import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/common/route/locations/locations.dart';
import 'package:store_demo/common/route/route.dart';

class HomeWrapperScreen extends HookConsumerWidget {
  HomeWrapperScreen({super.key});

  static final _beamerKey = GlobalKey<BeamerState>();

  late final _routerDelegate = BeamerDelegate(
    initialPath: HomeLocation.route,
    updateParent: false,
    locationBuilder: homeLocationBuilder,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        final currentLocation = _routerDelegate.currentBeamLocation;

        if (currentLocation is HomeLocation) return false;
        return true;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: SizedBox(
        //     height: 40,
        //     width: 40,
        //     child: Image.asset('assets/shopping-cart.png'),
        //   ),
        //   centerTitle: false,
        //   automaticallyImplyLeading: false,
        //   elevation: 0,
        //   backgroundColor: const Color(0xFF404453),
        // ),
        bottomNavigationBar: BottomNavBar(_beamerKey),
        body: Stack(
          children: [
            Beamer(
              key: _beamerKey,
              routerDelegate: _routerDelegate,
              backButtonDispatcher:
                  BeamerBackButtonDispatcher(delegate: _routerDelegate),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar(this.beamerKey, {Key? key}) : super(key: key);

  final GlobalKey<BeamerState> beamerKey;

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  late BeamerDelegate _beamerDelegate;
  int? _currentIndex = 0;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex = () {
      if (_beamerDelegate.currentBeamLocation is LoginLocation) {
        return 0;
      } else if (_beamerDelegate.currentBeamLocation is HomeLocation) {
        return 1;
      } else if (_beamerDelegate.currentBeamLocation is CartLocation) {
        return 2;
      }
    }();

    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 20,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 72,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0xFF404453),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => _beamerDelegate.beamToNamed(LoginLocation.route),
                child: _currentIndex == 0
                    ? Icon(
                        Icons.search_outlined,
                        color: Colors.green.shade400,
                      )
                    : const Icon(Icons.search_outlined, color: Colors.white),
              ),
              GestureDetector(
                onTap: () => _beamerDelegate.beamToNamed(HomeLocation.route),
                child: _currentIndex == 1
                    ? Icon(
                        Icons.home_outlined,
                        color: Colors.green.shade400,
                      )
                    : const Icon(Icons.home_outlined, color: Colors.white),
              ),
              GestureDetector(
                onTap: () => _beamerDelegate.beamToNamed(CartLocation.route),
                child: _currentIndex == 2
                    ? Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.green.shade400,
                      )
                    : const Icon(Icons.shopping_cart_outlined,
                        color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
