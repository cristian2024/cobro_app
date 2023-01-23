// ignore_for_file: file_names
import 'package:cobro_app/languages/language.dart';

class LanguageEnUs extends Language {
  @override
  String get languageName => 'US english';

  @override
  String get countryCode => 'US';

  factory LanguageEnUs() {
    return LanguageEnUs.fromMap(const {});
  }

  //app basics values
  late final String _appBarTitle1;
  late final String _settingsTooltipText;

  //signin values
  late final String _signinTitle;
  late final String _signinOptionsTitle;
  late final String _signinButtonText;
  late final String _signinPasswordLabel;
  late final String _signinUsernameLabel;

  //other values
  late final String _themeSelectorTitle;
  late final String _languageSelectorTitle;

  LanguageEnUs.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    //app basics
    _appBarTitle1 = map[Language.appBarTitle1Json] ?? 'Cobro app';
    _settingsTooltipText =
        map[Language.settingsTooltipTextJson] ?? 'App settings';

    _signinTitle = map[Language.signInTitleJson] ?? 'Sign in';
    _signinOptionsTitle = map[Language.signInOptionsTitlejson] ?? 'Or use';
    _signinButtonText = map[Language.signInButtonTextJson] ?? 'Sign in';
    _signinPasswordLabel = map[Language.signInPasswordLabeljson] ?? 'Password';
    _signinUsernameLabel =
        map[Language.signInUsernameLabeljson] ?? 'Username/email';

    //others
    _themeSelectorTitle =
        map[Language.themeSelectorTitleJson] ?? 'Theme selector';
    _languageSelectorTitle =
        map[Language.languageSelectorTitleJson] ?? 'Language selector';
  }
  //app basics values
  @override
  String get appBarTitle1 => _appBarTitle1;
  @override
  String get settingsTooltipText => _settingsTooltipText;

  //signin values
  @override
  String get signInTitle => _signinTitle;
  @override
  String get signInOptionsTitle => _signinOptionsTitle;
  @override
  String get signInButtonText => _signinButtonText;
  @override
  String get signInPasswordLabel => _signinPasswordLabel;
  @override
  String get signInUsernameLabel => _signinUsernameLabel;

  //others
  @override
  String get themeSelectorTitle => _themeSelectorTitle;
  @override
  String get languageSelectorTitle => _languageSelectorTitle;
}
