import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/home/data/repository/repository.dart';
import 'package:store_demo/feature/home/dependency_injection/dependency_injection.dart';

final productRepositoryDI = Provider((ref) {
  final remoteSource = ref.read(productRemoteSourceDI);

  return ProductRepositoryImpl(
    remoteSource: remoteSource,
  );
});
