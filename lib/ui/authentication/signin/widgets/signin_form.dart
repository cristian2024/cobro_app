import 'package:cobro_app/ui/common/widgets/buttons/common_button.dart';
import 'package:cobro_app/ui/common/widgets/forms/common_text_form_field.dart';
import 'package:cobro_app/utils/size_screen.dart';
import 'package:flutter/material.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CommonTFField(
            labelText: 'Username',
          ),
          const CommonTFField(
            labelText: 'Password',
          ),
          SizedBox(
            height: SizeScreens.height(context, 16),
          ),
          const CommonButton(text: 'Sign in'),
        ],
      ),
    );
  }
}
