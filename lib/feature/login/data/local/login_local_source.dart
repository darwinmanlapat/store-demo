import 'package:store_demo/common/service/service.dart';

class LoginLocalSource {
  LoginLocalSource(
    SecureStorageService secureStorageService,
  ) : _secureStorageService = secureStorageService;

  final SecureStorageService _secureStorageService;

  Future<void> storeAccessToken(String accessToken) async {
    await _secureStorageService.storeAccessToken(accessToken);
  }

  Future<void> deleteAccessToken() async {
    await _secureStorageService.deleteAccessToken();
  }
}
