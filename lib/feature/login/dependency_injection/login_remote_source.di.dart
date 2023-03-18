import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/common/dio/dio.dart';
import 'package:store_demo/feature/login/data/remote/remote.dart';

final loginRemoteSourceDI = Provider((ref) {
  final httpClient = ref.read(dioClientprovider);

  return LoginRemoteSource(
    httpClient: httpClient,
  );
});
