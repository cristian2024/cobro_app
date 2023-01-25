import 'package:cobro_app/bloc/authentication/authentication_bloc.dart';
import 'package:cobro_app/bloc/bloc_config.dart';
import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/exceptions/authentication/auth_code_converter.dart';
import 'package:cobro_app/exceptions/authentication/auth_exceptions.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/ui/authentication/signin/widgets/signin_form.dart';
import 'package:cobro_app/ui/authentication/common/sign_options.dart';
import 'package:cobro_app/ui/authentication/signup/signup_screen.dart';
import 'package:cobro_app/utils/size_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  static const routeName = '/auth';

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

GlobalKey<FormState> signinKey = GlobalKey<FormState>();

class _SigninScreenState extends State<SigninScreen> {
  _showSnackbar(String text) {
    SnackBar snackBar = SnackBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      content: Text(
        text,
      ),
      duration: const Duration(
        milliseconds: 2000,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesCubit, Language>(
      builder: (context, state) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, authState) {
            if (authState.status == ReqStatus.fail &&
                authState.exception != null) {
              String mssg = AuthConverter.getMessage(
                state,
                authState.exception!,
              );

              _showSnackbar(mssg);
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(
                  SizeScreens.width(context, 16),
                ).copyWith(
                  left: SizeScreens.width(context, 20),
                  right: SizeScreens.width(context, 20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.signInTitle),
                    const SigninForm(),
                    SizedBox(
                      height: SizeScreens.height(context, 40),
                    ),
                    const SignOptions(),
                    SizedBox(
                      height: SizeScreens.height(context, 40),
                    ),
                    const _NeedAccount(),
                    SizedBox(
                      height: SizeScreens.height(context, 80),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NeedAccount extends StatelessWidget {
  const _NeedAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesCubit, Language>(
      builder: (context, state) {
        return RichText(
          text: TextSpan(
            text: '${state.authNeedAccount} ',
            children: <TextSpan>[
              TextSpan(
                text: state.signUpTitle.toUpperCase(),
                //TODO - use theme texstyle as basis
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).pushNamed(
                      SignupScreen.routeName,
                    );
                  },
              ),
            ],
          ),
        );
      },
    );
  }
}
