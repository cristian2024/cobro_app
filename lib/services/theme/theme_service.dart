import 'package:cobro_app/helpers/storage/theme_storage.dart';
import 'package:cobro_app/ui/theme.dart';
import 'package:flutter/material.dart';

class ThemeService {
  Future<ThemeData> getThemeDataFromStorage() async {
    
    AppTheme theme = AppTheme();
    String optionStored = (await ThemeStorage.getThemeOption()) ?? 'light';
    ThemeOptions option = theme.fromString(optionStored);

    return theme.themes()[option] ?? theme.globalTheme();
  }
}
