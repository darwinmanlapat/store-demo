import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/common/route/locations/locations.dart';
import 'package:store_demo/feature/settings/presentation/view_model/view_model.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsNotifier = ref.read(settingsProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Clear Sans',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Color(0xFF404453),
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              shadowColor: const Color(0xFF404453),
              elevation: 2,
              child: ListTile(
                title: const Text('Logout'),
                trailing: const Icon(Icons.logout_outlined),
                onTap: () {
                  settingsNotifier.logout(() {
                    Beamer.of(context, root: true).beamToNamed(
                      LoginLocation.route,
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
