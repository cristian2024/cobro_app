import 'package:cobro_app/bloc/authentication/authentication_bloc.dart';
import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/models/user/user_model.dart';
import 'package:cobro_app/ui/authentication/signin/signin_screen.dart';
import 'package:cobro_app/ui/common/widgets/buttons/minimalist_text_button.dart';
import 'package:cobro_app/ui/common/widgets/forms/common_password_field.dart';
import 'package:cobro_app/ui/common/widgets/forms/common_text_form_field.dart';
import 'package:cobro_app/utils/size_screen.dart';
import 'package:cobro_app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  //validates if current form is sendable and sends it
  _validateAndSend() {
    if (signinKey.currentState?.validate() ?? false) {
      signinKey.currentState?.save();
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
        SignInWithFormEvent(
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
          key: signinKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTFField(
                labelText: state.authEmailLabel,
                controller: _emailController,
                validator: (value) => Validators.emailValidator(value, state),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              CommonPasswordField(
                labelText: state.authPasswordLabel,
                controller: _passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(
                height: SizeScreens.height(context, 16),
              ),
              MinimalistTextButton(
                state.signInButtonText,
                onTap: _validateAndSend,
              ),
            ],
          ),
        );
      },
    );
  }
}
