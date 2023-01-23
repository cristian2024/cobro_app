// ignore_for_file: file_names
import 'package:cobro_app/languages/language.dart';

class LanguageEsCo extends Language {
  @override
  String get languageName => 'Colombian spanish';
  @override
  String get countryCode => 'CO';

  factory LanguageEsCo() {
    return LanguageEsCo.fromMap(const {});
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

  LanguageEsCo.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    //app basics
    _appBarTitle1 = map[Language.appBarTitle1Json] ?? 'Cobro app';
    _settingsTooltipText =
        map[Language.settingsTooltipTextJson] ?? 'Configuraciones de app';

    //sign in
    _signinTitle = map[Language.signInTitleJson] ?? 'Inicia sesión';
    _signinOptionsTitle = map[Language.signInOptionsTitlejson] ?? 'O usa';
    _signinButtonText = map[Language.signInButtonTextJson] ?? 'Iniciar';
    _signinPasswordLabel =
        map[Language.signInPasswordLabeljson] ?? 'Contraseña';
    _signinUsernameLabel =
        map[Language.signInUsernameLabeljson] ?? 'Usuario/correo';

    //others
    _themeSelectorTitle =
        map[Language.themeSelectorTitleJson] ?? 'Selector de tema';
    _languageSelectorTitle =
        map[Language.languageSelectorTitleJson] ?? 'Selector de lenguaje';
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