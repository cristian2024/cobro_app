import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/ui/authentication/signin/signin_screen.dart';
import 'package:cobro_app/ui/authentication/signup/signup_screen.dart';
import 'package:cobro_app/ui/common/widgets/buttons/common_button.dart';
import 'package:cobro_app/ui/common/widgets/forms/common_text_form_field.dart';
import 'package:cobro_app/utils/size_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesCubit, Language>(
      builder: (context, state) {
        return Form(
          key: signupKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTFField(
                labelText: state.authUserLabel,
              ),
              CommonTFField(
                labelText: state.authPasswordLabel,
              ),
              SizedBox(
                height: SizeScreens.height(context, 16),
              ),
              CommonButton(text: state.signUpButtonText),
            ],
          ),
        );
      },
    );
  }
}
