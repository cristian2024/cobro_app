import 'package:cobro_app/helpers/storage/theme_storage.dart';
import 'package:cobro_app/ui/theme.dart';
import 'package:flutter/material.dart';

class ThemeService {
  static final AppThemes _theme = AppThemes();
  Future<ThemeData> getThemeDataFromStorage() async {
    String optionStored = (await ThemeStorage.getThemeOption()) ?? 'light';
    ThemeOptions option = _theme.fromString(optionStored);

    return _theme.themes()[option] ?? _theme.globalTheme;
  }

  Future<void> setThemeDataOnStorage(ThemeOptions optionTheme) async {
    String value = _theme.toOptionString(optionTheme);
    ThemeStorage.setThemeOption(value);
  }

  ThemeData getThemeFromOption(ThemeOptions optionTheme) =>
      _theme.themes()[optionTheme] ?? _theme.globalTheme;
}
