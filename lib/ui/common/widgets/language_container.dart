import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/utils/size_screen.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class LanguageContainer extends StatelessWidget {
  const LanguageContainer({
    super.key,
    required this.language,
  });
  final Language language;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flag.fromString(
          language.countryCode,
          height: SizeScreens.height(context, 24),
          width: SizeScreens.height(context, 24),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(language.languageName),
      ],
    );
  }
}
