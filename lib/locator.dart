import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'service/flutter_secure_storage_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  getIt.registerLazySingleton<FlutterSecureStorageService>(
    () => FlutterSecureStorageService(
      getIt<FlutterSecureStorage>(),
    ),
  );
}
