import 'package:flutter/material.dart';
import 'package:simply_app/routs/routs_names.dart';

//
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.HOME:
        return MaterialPageRoute(
          builder: ((context) => const Scaffold(
                body: Center(
                  child: Text('Home'),
                ),
              )),
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
