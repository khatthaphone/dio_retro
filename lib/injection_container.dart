import 'package:alice/alice.dart';
import 'package:dio_retro/network/dio_client.dart';
import 'package:get_it/get_it.dart';

import 'api/app_api.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton(() => AppApi(getIt()));

  final dioClient = DioClient();
  getIt.registerLazySingleton(() => dioClient.provideDao());

  getIt.registerLazySingleton(() => Alice(showNotification: true, showInspectorOnShake: true));
}