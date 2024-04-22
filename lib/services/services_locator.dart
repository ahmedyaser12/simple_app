import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_services/api_service.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton<ApiService>(
    () => ApiService(),
  );
  locator.registerLazySingleton(() => Dio());
  // locator.registerFactoryParam<DioConsumer, String, String>(
  //   (header, baseUrl) =>
  //       DioConsumer(dio: locator(), header, null, baseUrl: baseUrl),
  // );
}
