import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:simply_app/screens/login_screen/logic/login_cubit.dart';

import 'api_services/api_service.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton<ApiService>(
    () => ApiService(),
  );
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton<LoginCubit>(() => LoginCubit());
}
