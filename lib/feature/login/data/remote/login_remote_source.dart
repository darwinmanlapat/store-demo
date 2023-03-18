import 'package:dio/dio.dart';

class LoginRemoteSource {
  const LoginRemoteSource({
    required Dio httpClient,
  }) : _httpClient = httpClient;

  final Dio _httpClient;

  Future<String?> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
          'https://fakestoreapi.com/auth/login',
          data: <String, dynamic>{
            'username': username,
            'password': password,
          },
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ));

      if (response.statusCode == 200) {
        final token = response.data?['token'] as String;
        return token;
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
