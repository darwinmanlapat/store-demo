import 'package:store_demo/feature/login/data/local/local.dart';
import 'package:store_demo/feature/login/data/remote/remote.dart';
import 'package:store_demo/feature/login/domain/repository/repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({
    required LoginRemoteSource remoteSource,
    required LoginLocalSource localSource,
  })  : _remoteSource = remoteSource,
        _localSource = localSource;

  final LoginRemoteSource _remoteSource;
  final LoginLocalSource _localSource;

  @override
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final result =
        await _remoteSource.login(username: username, password: password);

    if (result != null) {
      await _localSource.storeAccessToken(result);
      return true;
    }

    return false;
  }

  @override
  Future<void> logout() async {
    await _localSource.deleteAccessToken();
  }
}
