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
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    // backgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark().copyWith(
        // background: Colors.black,
        // background:  const Colors.?
        ),
  );
}

/// App's global theme.
class AppTheme {
  late TextStyle _initialTextStyle;
  AppTheme({
    TextStyle? initialTextStyle,
  }) {
    _initialTextStyle = initialTextStyle ?? GoogleFonts.openSans();
  }
  ColorScheme _colorScheme(ColorScheme? initialColorScheme) {
    return (initialColorScheme ?? const ColorScheme.dark()).copyWith(
      tertiary: const Color(0xff88adfe),
      onPrimary: const Color(0xffffffff),
      primary: const Color(0xFF416AFB),
      onBackground: const Color(0xffffffff),
      secondary: const Color(0xff072448),
      primaryContainer: Colors.white,
      secondaryContainer: const Color(0xfff5f2f0),
      tertiaryContainer: const Color(0xff52c4c3),
    );
  }

  TextTheme _globalTextTheme(TextTheme initialTextTheme) {
    return initialTextTheme.copyWith(
      headline1: _initialTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
        color: const Color(0xff072448),
      ),
      headline2: _initialTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
        color: const Color(0xff072448),
      ),
      headline3: _initialTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
        color: const Color(0xff072448),
      ),
      bodyText1: _initialTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        color: const Color(0xff072448),
      ),
      bodyText2: _initialTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: const Color(0xff072448),
      ),
      subtitle1: _initialTextStyle.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        color: const Color(0xff072448),
      ),
      subtitle2: _initialTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 18.0,
        color: const Color(0xff072448),
      ),
    );
  }

  ThemeData globalTheme() {
    ThemeData theme = ThemeData.dark();
    return theme.copyWith(
      primaryColor: const Color.fromRGBO(65, 106, 251, 1),
      scaffoldBackgroundColor: const Color(0xfffffdfa),
      dividerColor: const Color(0xff4F647E),
      colorScheme: _colorScheme(theme.colorScheme),
      textTheme: _globalTextTheme(theme.textTheme),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
        backgroundColor: Color.fromRGBO(233, 223, 211, 1),
        centerTitle: false,
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1.0,
        color: Color(0xffE0E0E0),
        space: 5.0,
      ),
    );
  }
}

extension ThemeOption on AppTheme {
  static const Map<String, ThemeOptions> _strings = {
    'light': ThemeOptions.light,
    'dark': ThemeOptions.dark,
    'auto': ThemeOptions.auto,
    'semi': ThemeOptions.semi,
  };
  Map<ThemeOptions, ThemeData> themes() {
    return {
      ThemeOptions.light: globalTheme(),
      ThemeOptions.dark: ThemeData.dark(),
      ThemeOptions.semi: globalTheme(),
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
