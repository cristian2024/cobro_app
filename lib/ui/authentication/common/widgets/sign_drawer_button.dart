import 'package:cobro_app/bloc/authentication/authentication_bloc.dart';
import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/services/authentication/authentication_service.dart';
import 'package:cobro_app/ui/authentication/signin/signin_screen.dart';
import 'package:cobro_app/ui/main.ui/widgets/drawer_button.dart';
import 'package:cobro_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SignDrawerButton extends StatelessWidget {
  const SignDrawerButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (!isSigned(context, state)) {
          return _SignIn(
            onTap: onTap ??
                () {
                  Utils.mainNav.currentState?.pushNamedAndRemoveUntil(
                    SigninScreen.routeName,
                    (route) => false,
                  );
                },
          );
        }
        return _SignOut(
          onTap: () {},
        );
      },
    );
  }

  bool isSigned(BuildContext context, AuthenticationState state) =>
      Provider.of<AuthenticationService>(context).isSign() &&
      // state.currentUserData != null;
      true;
}

class _SignIn extends StatelessWidget {
  const _SignIn({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesCubit, Language>(
      builder: (context, lang) {
        return DrawerButton(
          icon: Icons.group_outlined,
          text: lang.signInButtonText,
          onTap: onTap,
        );
      },
    );
  }
}

class _SignOut extends StatelessWidget {
  const _SignOut({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesCubit, Language>(
      builder: (context, lang) {
        return DrawerButton(
          icon: Icons.exit_to_app,
          text: lang.signOutText,
          onTap: () {
            BlocProvider.of<AuthenticationBloc>(context).add(
              SignOutEvent(),
            );
          },
        );
      },
    );
  }
}
