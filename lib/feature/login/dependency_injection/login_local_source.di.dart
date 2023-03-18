import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_demo/common/service/service.dart';
import 'package:store_demo/feature/login/data/local/login_local_source.dart';

final loginLocalSourceDI = Provider((ref) {
  final secureStorageService = ref.read(secureStorageServiceProvider.notifier);

  return LoginLocalSource(secureStorageService);
});
