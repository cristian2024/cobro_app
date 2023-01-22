// ignore_for_file: file_names
import 'package:cobro_app/languages/language.dart';

class LanguageEnUs extends Language {
  @override
  String languageName = 'es co';

  factory LanguageEnUs(){
    return LanguageEnUs.fromMap({});
  }

  late final String _signinTitle;
  late final String _signinOptionsTitle;
  late final String _signinButtonText;
  late final String _signinPasswordLabel;
  late final String _signinUsernameLabel;

  LanguageEnUs.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _signinTitle = map[Language.signInTitleJson] ?? 'Inicia sesión';
    _signinOptionsTitle = map[Language.signInOptionsTitlejson] ?? 'O usa';
    _signinButtonText = map[Language.signInButtonTextJson] ?? 'Iniciar';
    _signinPasswordLabel = map[Language.signInPasswordLabeljson] ?? 'Contraseña';
    _signinUsernameLabel = map[Language.signInUsernameLabeljson] ?? 'Usuario/correo';
  }

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
}
