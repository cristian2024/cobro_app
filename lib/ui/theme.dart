import 'package:cobro_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ThemeOptions {
  light,
  dark,
  semi,
  auto,
}

class AppThemes {
  static final _familyFont = GoogleFonts.lato();

  static TextTheme _themeBasis(ThemeData theme) {
    return theme.textTheme.copyWith(
      bodyText1: _familyFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: _familyFont.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      headline3: _familyFont.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headline2: _familyFont.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      headline1: _familyFont.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      
    );
  }

  static TextTheme get _darkTextTheme => _themeBasis(ThemeData.dark());

  static TextTheme get _lightTextTheme => _themeBasis(ThemeData.light());

  static TextTheme get _mediumTextTheme => _themeBasis(ThemeData.light());

  static final _darkTheme = ThemeData.dark().copyWith(
    // backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(62, 6, 95, 1),
      iconTheme: IconThemeData(
        color: CColors.paleLavender,
      ),
    ),
    textTheme: _darkTextTheme,
    drawerTheme: const DrawerThemeData(
      backgroundColor: CColors.deepViolet,
    ),
    iconTheme: const IconThemeData(
      color: CColors.paleLavender,
    ),
    colorScheme: const ColorScheme.dark().copyWith(),
  );
  static final ThemeData _lightTheme = ThemeData.light().copyWith(
    // backgroundColor: Colors.black,
    // scaffoldBackgroundColor: Colors.grey.shade900,
    scaffoldBackgroundColor: CColors.paleLavender,
    appBarTheme: const AppBarTheme(
      backgroundColor: CColors.vodka,
      iconTheme: IconThemeData(
        color: CColors.deepViolet,
      ),
    ),
    textTheme: _lightTextTheme,
    drawerTheme: const DrawerThemeData(
      backgroundColor: CColors.vodka,
    ),
    iconTheme: const IconThemeData(
      color: CColors.deepViolet,
    ),
    colorScheme: const ColorScheme.dark().copyWith(),
  );

  static final ThemeData _mediumTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: CColors.blueBell,
    appBarTheme: const AppBarTheme(
      backgroundColor: CColors.purpleNavy,
      iconTheme: IconThemeData(
        color: CColors.aliceBlue,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: CColors.purpleNavy,
    ),
    textTheme: _mediumTextTheme,
    iconTheme: const IconThemeData(
      color: CColors.aliceBlue,
    ),
    colorScheme: const ColorScheme.dark().copyWith(),
  );
  ThemeData get globalTheme => _lightTheme;
}

extension ThemeOption on AppThemes {
  static const Map<String, ThemeOptions> _strings = {
    'light': ThemeOptions.light,
    'dark': ThemeOptions.dark,
    'auto': ThemeOptions.auto,
    'semi': ThemeOptions.semi,
  };
  Map<ThemeOptions, ThemeData> themes() {
    return {
      ThemeOptions.light: AppThemes._lightTheme,
      ThemeOptions.dark: AppThemes._darkTheme,
      ThemeOptions.semi: AppThemes._mediumTheme,
    };
  }

  ThemeOptions fromString(String option) =>
      _strings[option] ?? ThemeOptions.auto;

  String toOptionString(ThemeOptions option) {
    for (String val in _strings.keys) {
      if (_strings[val] == option) {
        return val;
      }
    }
    return 'auto';
  }
}
