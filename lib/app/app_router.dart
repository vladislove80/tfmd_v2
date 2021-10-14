import 'package:flutter/material.dart';
import 'package:tfmd_v2/flows/home_page/home_page.dart';
import 'package:tfmd_v2/flows/splash_page/splash_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
            builder: (context) => HomePage());
      case SplashPage.routeName:
        return MaterialPageRoute(builder: (context) => SplashPage());
      default:
        return null;
    }
  }
}