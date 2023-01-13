import 'package:cobro_app/ui/widgets/buttons/ripple_button.dart';
import 'package:flutter/material.dart';

class MinimalistButton extends StatelessWidget {
  const MinimalistButton({
    super.key,
    this.decoration,
    this.padding,
    required this.icon,
  });

  final BoxDecoration? decoration;
  final IconData icon;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    BoxDecoration minDecoration =
        (decoration ?? const BoxDecoration()).copyWith(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    );
    return RippleButton(
      customBorder: minDecoration.border,
      child: Container(
        decoration: minDecoration,
        padding: padding,
        child: Icon(icon),
      ),
    );
  }
}
