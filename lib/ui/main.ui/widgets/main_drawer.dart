import 'package:cobro_app/ui/accounts/widgets/account_drawer_button.dart';
import 'package:cobro_app/ui/authentication/common/widgets/sign_drawer_button.dart';
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
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: const [
                    AccountDrawerButton(),
                  ],
                ),
              ),
              const SignDrawerButton(),
            ],
          ),
        ),
      ),
    );
  }
}
