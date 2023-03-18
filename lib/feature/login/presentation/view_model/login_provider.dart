import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/login/dependency_injection/login_repository.di.dart';
import 'package:store_demo/feature/login/domain/model/model.dart';
import 'package:store_demo/feature/login/domain/repository/repository.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginModel>((ref) {
  final repository = ref.read(loginRepositoryDI);

  return LoginNotifier(
    repository: repository,
    ref: ref,
  );
});

class LoginNotifier extends StateNotifier<LoginModel> {
  LoginNotifier({
    LoginModel? state,
    required this.repository,
    required this.ref,
  }) : super(state ?? const LoginModel.initial());

  final LoginRepository repository;
  final Ref ref;

  void onUsernameChange(String username) {
    if (username.isEmpty) {
      state = state.copyWith(
        username: username,
        usernameError: 'Username is required',
      );
      return;
    }

    state = state.copyWith(
      username: username,
      usernameError: null,
      loginError: null,
    );
  }

  void onPasswordChange(String password) {
    if (password.isEmpty) {
      state = state.copyWith(
        password: password,
        passwordError: 'Password is required',
      );
      return;
    }
    state = state.copyWith(
      password: password,
      passwordError: null,
      loginError: null,
    );
  }

  Future<void> login(VoidCallback callback) async {
    try {
      state = state.copyWith(isLoading: true, loginError: null);

      final isAuth = await repository.login(
        username: state.username,
        password: state.password,
      );
      print(isAuth);
      if (isAuth) {
        state = const LoginModel.initial();
        callback();
      }
    } catch (e) {
      print(e);
      state = state.copyWith(
        isLoading: false,
        loginError: 'Invalid Credentials. Failed to login.',
      );
    }
  }
}
