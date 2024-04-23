import 'package:flutter/material.dart';
import 'package:simply_app/routs/routs_names.dart';
import 'package:simply_app/screens/home/UI/home.dart';
import 'package:simply_app/screens/login_screen/ui/login_screen.dart';

//
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.HOME:
        return MaterialPageRoute(
          builder: ((context) => const Home()),
        );
    case RouteName.LOGIN:
        return MaterialPageRoute(
          builder: ((context) => const LoginScreen()),
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
