import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeStorage {
  static const _storage = FlutterSecureStorage();

  static const String _keyTheme = 'theme_option';

  static Future setThemeOption(String option) async => await _storage.write(
        key: _keyTheme,
        value: option,
      );
  static Future<String?> getThemeOption() => _storage.read(key: _keyTheme);
    
}
