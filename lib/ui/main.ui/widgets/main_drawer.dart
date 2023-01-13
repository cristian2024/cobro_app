import 'package:cobro_app/ui/main.ui/widgets/theme_selector.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: const [
            ThemeSelector(),
          ],
        ),
      ),
    );
  }
}
