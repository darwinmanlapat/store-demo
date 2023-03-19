import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_demo/common/provider/provider.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    UncontrolledProviderScope(
      container: ProviderContainer(overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ]),
      child: const StoreApp(),
    ),
  );
}
