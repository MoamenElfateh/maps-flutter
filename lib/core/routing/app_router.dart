import 'package:flutter/material.dart';
import 'package:maps_flutter/core/routing/routes.dart';
import 'package:maps_flutter/features/login/ui/screen/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return null;
    }
  }
}
