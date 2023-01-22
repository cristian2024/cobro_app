import 'package:cobro_app/ui/authentication/signin/widgets/signin_form.dart';
import 'package:cobro_app/ui/authentication/signin/widgets/signin_options.dart';
import 'package:cobro_app/utils/size_screen.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  static const routeName = 'sign_in';

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

GlobalKey<FormState> signinKey = GlobalKey<FormState>();

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
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
              const Text('Sign in'),
              const SigninForm(),
              SizedBox(
                height: SizeScreens.height(context, 40),
              ),
              const SigninOptions(),
              SizedBox(
                height: SizeScreens.height(context, 230),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
