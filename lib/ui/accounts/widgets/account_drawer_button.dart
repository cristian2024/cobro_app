import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/ui/accounts/screens/accounts_screen.dart';
import 'package:cobro_app/ui/main.ui/widgets/drawer_button.dart';
import 'package:cobro_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDrawerButton extends StatelessWidget {
  const AccountDrawerButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesCubit, Language>(
      builder: (context, lang) {
        return DrawerButton(
          icon: Icons.group_outlined,
          text: lang.accountDrawerText,
          onTap: onTap ??
              () {
                Utils.drawerNav.currentState?.pushNamed(
                  AccountsScreen.routeName,
                );
                Utils.mainNav.currentState?.pop();
              },
        );
      },
    );
  }
}
