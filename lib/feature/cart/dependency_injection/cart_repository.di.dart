import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/cart/data/repository/repository.dart';
import 'package:store_demo/feature/cart/dependency_injection/dependency_injection.dart';

final cartRepositoryDI = Provider((ref) {
  final remoteSource = ref.read(cartRemoteSourceDI);

  return CartRepositoryImpl(
    remoteSource: remoteSource,
  );
});
