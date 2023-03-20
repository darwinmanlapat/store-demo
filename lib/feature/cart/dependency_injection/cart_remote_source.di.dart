import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/common/dio/dio.dart';
import 'package:store_demo/feature/cart/data/remote/remote.dart';

final cartRemoteSourceDI = Provider((ref) {
  final httpClient = ref.read(dioClientprovider);

  return CartRemoteSource(
    httpClient: httpClient,
  );
});
