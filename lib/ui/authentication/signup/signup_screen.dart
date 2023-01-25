import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/ui/authentication/common/sign_options.dart';
import 'package:cobro_app/ui/authentication/signin/signin_screen.dart';
import 'package:cobro_app/ui/authentication/signup/widgets/signup_form.dart';
import 'package:cobro_app/utils/size_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const routeName = '/${SigninScreen.routeName}/sign_up';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

GlobalKey<FormState> signupKey = GlobalKey<FormState>();

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesCubit, Language>(
      builder: (context, state) {
        return Scaffold(
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
                  Text(state.signUpTitle),
                  const SignupForm(),
                  SizedBox(
                    height: SizeScreens.height(context, 40),
                  ),
                  const SignOptions(),
                  SizedBox(
                    height: SizeScreens.height(context, 40),
                  ),
                  const _AlreadyUser(),
                  SizedBox(
                    height: SizeScreens.height(context, 80),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AlreadyUser extends StatelessWidget {
  const _AlreadyUser({
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
                text: state.signInTitle.toUpperCase(),
                //TODO - use theme texstyle as basis
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      Navigator.of(context).pushNamed(
                        SigninScreen.routeName,
                      );
                    }
                  },
              ),
            ],
          ),
        );
      },
    );
  }
}
