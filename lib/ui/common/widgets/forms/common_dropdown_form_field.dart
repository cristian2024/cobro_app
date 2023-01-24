import 'package:flutter/material.dart';

class CommonDropdownFormField<T> extends StatelessWidget {
  const CommonDropdownFormField({
    super.key,
    this.onSaved,
    this.onChange,
    required this.items,
    this.value,
    this.hintText,
    this.labelText,
  });

  //function values
  final Function(T? value)? onSaved;
  final Function(T? value)? onChange;

  //items values
  final List<DropdownMenuItem<T>>? items;
  final T? value;

  //style values
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      items: items,
      value: value,
      onSaved: onSaved,
      onChanged: onChange,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
