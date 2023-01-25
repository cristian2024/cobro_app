import 'package:cobro_app/helpers/storage/language_storage.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/languages/language_en_us.dart';
import 'package:cobro_app/languages/language_list.dart';

class LanguageService {
  Future<Language> getLanguageFromStorage() async {
    String? languageName = (await LanguageStorage.getLanguageOption());

    Language language;
    if (languageName == null) {
      language = LanguageEnUs();
      setLanguageInStorage(language);
    }
    language= LanguageList().getLanguages[languageName]??LanguageEnUs();
    return language;
  }

  void setLanguageInStorage(Language language) =>
      setLanguageFromString(language.languageName);

  void setLanguageFromString(String language) =>
      LanguageStorage.setLanguageOption(language);
}
