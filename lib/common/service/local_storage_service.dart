import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_demo/common/provider/provider.dart';

class LocalStorageService extends LocalStorageServiceNotifier {
  LocalStorageService(
    SharedPreferences localStorage,
  )   : _localStorage = localStorage,
        super(VoidCallback);

  final SharedPreferences _localStorage;

  static const _isAuthenticated = 'isAuthenticated';

  Future<void> storeAuthentication(bool isAuthenticated) async {
    await _localStorage.setBool(_isAuthenticated, isAuthenticated);
  }

  bool? getAuthentication() => _localStorage.getBool(_isAuthenticated);

  Future<void> deleteAuthentication() async {
    await _localStorage.remove(_isAuthenticated);
  }
}

final localStorageServiceProvider = LocalStorageServiceProvider((ref) {
  final localStorage = ref.read(sharedPreferencesProvider);

  return LocalStorageService(localStorage);
});

typedef LocalStorageServiceNotifier = StateNotifier<void>;

typedef LocalStorageServiceProvider
    = StateNotifierProvider<LocalStorageService, void>;
