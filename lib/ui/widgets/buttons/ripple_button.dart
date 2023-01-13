import 'package:flutter/material.dart';

class RippleButton extends StatelessWidget {
  const RippleButton({
    super.key,
    this.splashColor,
    this.backgroundColor,
    this.customBorder,
    required this.child,
  });

  //decoration values
  final Color? splashColor;
  final Color? backgroundColor;
  final ShapeBorder? customBorder;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        color: backgroundColor,
        child: InkWell(
          customBorder: customBorder,
          onTap: () {},
          splashColor: splashColor,
          child: child,
        ),
      ),
    );
  }
}
