import 'package:cobro_app/ui/authentication/signin/signin_screen.dart';
import 'package:cobro_app/ui/authentication/signup/signup_screen.dart';
import 'package:cobro_app/ui/common/screens/no_internet.dart';
import 'package:cobro_app/ui/main.ui/main_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = MainPage.routeName;
  static Map<String, Widget Function(BuildContext)> routes = {
    MainPage.routeName: (context) => const MainPage(),
    '/${NoInternet.routeName}': (context) => const NoInternet(),
    SigninScreen.routeName: (context) => const SigninScreen(),
    SignupScreen.routeName: (context) => const SignupScreen(),
   
  };
}
