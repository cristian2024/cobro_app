import 'package:cobro_app/ui/main.ui/main_page.dart';
import 'package:flutter/material.dart';

class AccountScreens extends StatelessWidget {
  const AccountScreens({super.key});

  static const routeName = '${MainPage.routeName}/accounts';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // ignore: prefer_const_constructors
      child: Text(
        'hola',
      ),
    );
  }
}
