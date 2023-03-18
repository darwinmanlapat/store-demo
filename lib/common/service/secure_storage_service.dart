import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecureStorageService extends SecureStorageServiceNotifier {
  SecureStorageService(
    FlutterSecureStorage secureStorage,
  )   : _secureStorage = secureStorage,
        super(VoidCallback);

  final FlutterSecureStorage _secureStorage;

  static const _accessTokenKey = 'accessToken';

  Future<void> storeAccessToken(String accessToken) async {
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<String?> getAccessToken() async {
    return _secureStorage.read(key: _accessTokenKey);
  }

  Future<void> deleteAccessToken() async {
    await _secureStorage.delete(key: _accessTokenKey);
  }
}

final secureStorageServiceProvider = SecureStorageServiceProvider((_) {
  const secureStorage = FlutterSecureStorage();

  return SecureStorageService(secureStorage);
});

typedef SecureStorageServiceNotifier = StateNotifier<void>;

typedef SecureStorageServiceProvider
    = StateNotifierProvider<SecureStorageService, void>;
