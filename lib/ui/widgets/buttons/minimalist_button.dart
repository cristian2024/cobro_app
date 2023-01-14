import 'package:cobro_app/ui/widgets/buttons/ripple_button.dart';
import 'package:flutter/material.dart';

class MinimalistButton extends StatelessWidget {
  const MinimalistButton({
    super.key,
    this.decoration,
    this.padding,
    this.onTap,
    required this.icon,
  });

  final BoxDecoration? decoration;
  final IconData icon;
  final EdgeInsets? padding;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    BoxDecoration minDecoration =
        (decoration ?? const BoxDecoration()).copyWith(
      border: Border.all(
          color: Theme.of(context).iconTheme.color ?? Colors.white,
          style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(10),
    );
    return RippleButton(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: minDecoration.borderRadius ?? BorderRadius.circular(10),
      ),
      child: Container(
        decoration: minDecoration,
        padding: padding,
        child: Icon(icon),
      ),
    );
  }
}
