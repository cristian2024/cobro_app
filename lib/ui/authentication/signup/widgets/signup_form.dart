import 'package:cobro_app/bloc/authentication/authentication_bloc.dart';
import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/models/user/user_model.dart';
import 'package:cobro_app/ui/authentication/signup/signup_screen.dart';
import 'package:cobro_app/ui/common/widgets/buttons/common_button.dart';
import 'package:cobro_app/ui/common/widgets/forms/common_text_form_field.dart';
import 'package:cobro_app/utils/size_screen.dart';
import 'package:cobro_app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //validates if current form is sendable and sends it
  _validateAndSend() {
    if (signupKey.currentState?.validate() ?? false) {
      signupKey.currentState?.save();
      //creating user model
      final user = UserModel(
        name: '',
        lastName: '',
        cellphone: '',
        email: _emailController.text,
        userName: '',
        birthDate: DateTime.now(),
        userType: UserType.client,
      );
      BlocProvider.of<AuthenticationBloc>(context).add(
        SignUpWithFormEvent(
          user: user,
          password: _passwordController.text,
        ),
      );
    }
  }

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
                labelText: state.authEmailLabel,
                controller: _emailController,
                validator: Validators.emailValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              CommonTFField(
                labelText: state.authPasswordLabel,
                controller: _passwordController,
                validator: Validators.passwordValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(
                height: SizeScreens.height(context, 16),
              ),
              CommonButton(
                text: state.signUpButtonText,
                onClick: _validateAndSend,
              ),
            ],
          ),
        );
      },
    );
  }
}
