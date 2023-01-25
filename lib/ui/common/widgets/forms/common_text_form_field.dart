import 'package:flutter/material.dart';

class CommonTFField extends StatelessWidget {
  const CommonTFField({
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
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
