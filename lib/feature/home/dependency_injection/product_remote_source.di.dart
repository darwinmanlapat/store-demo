import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/common/dio/dio.dart';
import 'package:store_demo/feature/home/data/remote/remote.dart';

final productRemoteSourceDI = Provider((ref) {
  final httpClient = ref.read(dioClientprovider);

  return ProductRemoteSource(
    httpClient: httpClient,
  );
});
