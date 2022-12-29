import 'package:default_counter_app_bloc_library/presentation/screens/second_screen.dart';
import 'package:default_counter_app_bloc_library/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) =>
              const MyHomePage(color: Colors.white, title: 'home page'),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) =>
              const SecondScreen(color: Colors.lightBlue, title: 'second page'),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) =>
              const ThirdScreen(color: Colors.greenAccent, title: 'third page'),
        );
      default:
        return null;
    }
  }
}
