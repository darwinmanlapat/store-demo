import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/login/dependency_injection/login_repository.di.dart';
import 'package:store_demo/feature/login/domain/repository/repository.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, bool>((ref) {
  final repository = ref.read(loginRepositoryDI);

  return SettingsNotifier(
    repository: repository,
    ref: ref,
  );
});

class SettingsNotifier extends StateNotifier<bool> {
  SettingsNotifier({
    bool? state,
    required this.repository,
    required this.ref,
  }) : super(state ?? false);

  final LoginRepository repository;
  final Ref ref;

  Future<void> logout(VoidCallback callback) async {
    await repository.logout();
    callback();
  }
}
