import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonPasswordField extends StatefulWidget {
  const CommonPasswordField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.autovalidateMode,
  });
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;

  @override
  State<CommonPasswordField> createState() => _CommonPasswordFieldState();
}

class _CommonPasswordFieldState extends State<CommonPasswordField> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesCubit, Language>(
      builder: (context, state) {
        return TextFormField(
          obscureText: !isShow,
          autovalidateMode: widget.autovalidateMode,
          controller: widget.controller,
          validator: (value)=> Validators.passwordValidator(value, state),
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            suffixIcon: IconButton(
              onPressed: () => setState(() => isShow = !isShow),
              icon: Icon(
                icon,
              ),
            ),
          ),
        );
      },
    );
  }

  IconData get icon =>
      isShow ? Icons.visibility_outlined : Icons.visibility_off_outlined;
}
