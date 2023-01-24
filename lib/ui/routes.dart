import 'package:cobro_app/ui/authentication/signin/signin_screen.dart';
import 'package:cobro_app/ui/common/screens/no_internet.dart';
import 'package:cobro_app/ui/main.ui/initial_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = '/${InitialPage.routeName}';
  static Map<String, Widget Function(BuildContext)> routes = {
    '/${InitialPage.routeName}': (context) => const InitialPage(),
    '/${NoInternet.routeName}': (context) => const NoInternet(),
    '/${SigninScreen.routeName}': (context) => const SigninScreen(),
  };
}
