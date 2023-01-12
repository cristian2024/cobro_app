import 'package:cobro_app/ui/initial.page/initial_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = InitialPage.routeName;
  static Map<String, Function(BuildContext)> routes = {
    '/${InitialPage.routeName}': (context) => const InitialPage(),
  };
}
