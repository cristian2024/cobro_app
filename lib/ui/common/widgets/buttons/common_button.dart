import 'package:cobro_app/ui/common/widgets/buttons/ripple_button.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.text,
    this.onClick,
  });

  final String text;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return RippleButton(
      onTap: onClick,
      child: Text(text),
    );
  }
}
