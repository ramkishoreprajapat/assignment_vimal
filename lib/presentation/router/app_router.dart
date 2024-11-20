import 'package:flutter/material.dart';

import '../screens/authentications/login_screen.dart';
import '../screens/product/product_screen.dart';

class AppRouter {
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String product = 'product';

  Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case product:
        return MaterialPageRoute(builder: (_) => const ProductScreen());
      default:
        throw Exception('Route not found');
    }
  }
}
