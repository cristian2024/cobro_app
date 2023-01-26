import 'package:cobro_app/ui/accounts/account_screen1.dart';
import 'package:cobro_app/ui/accounts/account_screen2.dart';
import 'package:cobro_app/ui/accounts/widgets/account_drawer_button.dart';
import 'package:cobro_app/utils/utils.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: ListView(
            children: [
              AccountDrawerButton(),
              AccountDrawerButton(
                onTap: () {
                  Utils.drawerNav.currentState?.pushNamed(
                    AccountScreens1.routeName,
                  );
                  Utils.mainNav.currentState?.pop();
                },
              ),
              AccountDrawerButton(
                onTap: () {
                  Utils.drawerNav.currentState?.pushNamed(
                    AccountScreens2.routeName,
                  );
                  Utils.mainNav.currentState?.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
