import 'package:cobro_app/ui/main.ui/initial_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = '/${InitialPage.routeName}';
  static Map<String, Widget Function(BuildContext)> routes = {
    '/${InitialPage.routeName}': (context) => const InitialPage(),
  };
}
