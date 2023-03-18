// ignore: one_member_abstracts
abstract class LoginRepository {
  Future<bool> login({
    required String username,
    required String password,
  });

  Future<void> logout();
}