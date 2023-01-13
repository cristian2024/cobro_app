import 'package:flutter/material.dart';

class RippleButton extends StatelessWidget {
  const RippleButton({
    super.key,
    this.splashColor,
    this.backgroundColor,
    this.customBorder,
    this.onTap,
    required this.child,
  });

  //decoration values
  final Color? splashColor;
  final Color? backgroundColor;
  final ShapeBorder? customBorder;


  //main values of widget
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        color: backgroundColor,
        child: InkWell(
          customBorder: customBorder,
          onTap: onTap ?? () {},
          splashColor: splashColor,
          child: child,
        ),
      ),
    );
  }
}
