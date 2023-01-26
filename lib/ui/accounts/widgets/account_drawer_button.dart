import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/ui/accounts/account_screen.dart';
import 'package:cobro_app/ui/main.ui/widgets/drawer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDrawerButton extends StatelessWidget {
  const AccountDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesCubit, Language>(
      builder: (context, lang) {
        return DrawerButton(
          icon: Icons.group_outlined,
          text: lang.accountDrawerText,
          onTap: () {
            Navigator.of(context).pushNamed(
              AccountScreens.routeName,
            );
          },
        );
      },
    );
  }
}
