import 'package:flutter/material.dart';

class CommonPasswordField extends StatefulWidget {
  const CommonPasswordField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.validator,
    this.autovalidateMode,
  });
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  State<CommonPasswordField> createState() => _CommonPasswordFieldState();
}

class _CommonPasswordFieldState extends State<CommonPasswordField> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !isShow,
      autovalidateMode: widget.autovalidateMode,
      controller: widget.controller,
      validator: widget.validator,
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
  }

  IconData get icon =>
      isShow ? Icons.visibility_outlined : Icons.visibility_off_outlined;
}
