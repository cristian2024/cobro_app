import 'package:cobro_app/ui/common/widgets/buttons/ripple_button.dart';
import 'package:cobro_app/utils/theme_utils.dart';
import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    super.key,
    required this.icon,
    required this.text,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: RippleButton(
        child: ListTile(
          title: Container(
            margin: const EdgeInsets.only(
              right: 20,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: getSubtitle1(Theme.of(context)),
            ),
          ),
          leading: Icon(icon),
          trailing: Icon(
            icon,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
