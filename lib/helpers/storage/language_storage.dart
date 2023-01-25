import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LanguageStorage {
  static const _storage = FlutterSecureStorage();

  static const String _keyLanguage = 'language_option';

  static Future setLanguageOption(String option)  =>  _storage.write(
        key: _keyLanguage,
        value: option,
      );
  static Future<String?> getLanguageOption() => _storage.read(key: _keyLanguage);
}
