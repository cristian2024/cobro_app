import 'package:flutter/material.dart';

class CommonTFField extends StatelessWidget {
  const CommonTFField({
    super.key,
    this.hintText,
    this.labelText,
  });
  final String? labelText;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
