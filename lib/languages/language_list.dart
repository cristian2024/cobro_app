import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/languages/language_en_us.dart';
import 'package:cobro_app/languages/language_es_co.dart';

class LanguageList {
  static List<Language> availableLanguages = [
    LanguageEnUs(),
    LanguageEsCo(),
  ];
}
