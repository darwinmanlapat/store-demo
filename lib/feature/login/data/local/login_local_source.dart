import 'package:store_demo/common/service/service.dart';

class LoginLocalSource {
  LoginLocalSource(
    SecureStorageService secureStorageService,
    LocalStorageService localStorageService,
  )   : _secureStorageService = secureStorageService,
        _localStorageService = localStorageService;

  final SecureStorageService _secureStorageService;
  final LocalStorageService _localStorageService;

  Future<void> storeAccessToken(String accessToken) async {
    await _secureStorageService.storeAccessToken(accessToken);
  }

  Future<void> deleteAccessToken() async {
    await _secureStorageService.deleteAccessToken();
  }

  Future<void> storeAuthentication(bool isAuthenticated) async {
    await _localStorageService.storeAuthentication(isAuthenticated);
  }

  Future<void> deleteAuthentication() async {
    await _localStorageService.deleteAuthentication();
  }
}
