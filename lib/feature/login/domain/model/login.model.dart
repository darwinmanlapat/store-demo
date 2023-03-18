import 'package:flutter/material.dart';
import 'package:store_demo/common/helper/helper.dart';

@immutable
class LoginModel {
  final String username;
  final String? usernameError;
  final String password;
  final String? passwordError;
  final String? loginError;
  final bool isLoading;

  const LoginModel({
    required this.username,
    required this.usernameError,
    required this.password,
    required this.passwordError,
    required this.loginError,
    required this.isLoading,
  });

  const LoginModel.initial()
      : username = '',
        usernameError = null,
        password = '',
        passwordError = null,
        loginError = null,
        isLoading = false;

  LoginModel copyWith({
    String? username,
    Object? usernameError = optional,
    String? password,
    Object? passwordError = optional,
    Object? loginError = optional,
    bool? isLoading,
  }) {
    return LoginModel(
      username: username ?? this.username,
      usernameError: usernameError == optional
          ? this.usernameError
          : usernameError as String?,
      password: password ?? this.password,
      passwordError: passwordError == optional
          ? this.passwordError
          : passwordError as String?,
      loginError:
          loginError == optional ? this.loginError : loginError as String?,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel &&
        other.username == username &&
        other.usernameError == usernameError &&
        other.password == password &&
        other.passwordError == passwordError &&
        other.loginError == loginError &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        usernameError.hashCode ^
        password.hashCode ^
        passwordError.hashCode ^
        loginError.hashCode ^
        isLoading.hashCode;
  }

  @override
  String toString() {
    return 'LoginModel(username: $username, usernameError: $usernameError, password: $password, passwordError: $passwordError, loginError: $loginError, isLoading: $isLoading)';
  }
}
