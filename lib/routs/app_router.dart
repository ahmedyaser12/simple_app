import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_app/routs/routs_names.dart';
import 'package:simply_app/screens/home/UI/home.dart';
import 'package:simply_app/screens/home/logic/home_cubit.dart';
import 'package:simply_app/screens/login_screen/ui/login_screen.dart';
import 'package:simply_app/services/services_locator.dart';

import '../screens/login_screen/logic/login_cubit.dart';

//
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.HOME:
        return MaterialPageRoute(
          builder: ((context) => BlocProvider.value(
                value: locator<HomeCubit>()..getGallery(),
                child: const HomeScreen(),
              )),
        );
      case RouteName.LOGIN:
        return MaterialPageRoute(
          builder: ((context) => BlocProvider(
              create: (_) => locator<LoginCubit>(),
              child: const LoginScreen())),
        );

      default:
        return notFound();
    }
  }

  static Route<dynamic> notFound() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text('Not Fount'),
            ),
          )),
    );
  }
}
