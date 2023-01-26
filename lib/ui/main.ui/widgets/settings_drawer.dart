import 'package:cobro_app/ui/main.ui/widgets/language_selector.dart';
import 'package:cobro_app/ui/main.ui/widgets/theme_selector.dart';
import 'package:cobro_app/utils/size_screen.dart';
import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24,
          ),
          child: ListView(
            children: [
              const ThemeSelector(),
              SizedBox(
                height: SizeScreens.height(
                  context,
                  40,
                ),
              ),
              const LanguageSelector(),
            ],
          ),
        ),
      ),
    );
  }
}
