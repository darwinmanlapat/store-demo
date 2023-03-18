import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/feature/login/data/repository/login_repository_impl.dart';
import 'package:store_demo/feature/login/dependency_injection/dependency_injection.dart';

final loginRepositoryDI = Provider((ref) {
  final remoteSource = ref.read(loginRemoteSourceDI);
  final localSource = ref.read(loginLocalSourceDI);

  return LoginRepositoryImpl(
    remoteSource: remoteSource,
    localSource: localSource,
  );
});
