import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_app/routs/app_router.dart';
import 'package:simply_app/routs/routs_names.dart';
import 'package:simply_app/services/observer.dart';
import 'package:simply_app/services/services_locator.dart';

import 'core/helper/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setupLocator();
  await CacheHelper().init();
print(CacheHelper().getData(key: 'login'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: CacheHelper().getData(key: 'login') == true
          ? RouteName.HOME
          : RouteName.LOGIN,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
