// ignore_for_file: file_names
import 'package:cobro_app/languages/language.dart';

class LanguageEsCo extends Language {
  @override
  String get languageName => 'Colombian spanish';
  @override
  String get countryCode => 'CO';

  LanguageEsCo() {
    //app basics
    appBarTitle1 = 'Cobro app';
    settingsTooltipText = 'Configuraciones de app';

    //Authentication
    authPasswordLabel = 'Contraseña';
    authUserLabel = 'Usuario/correo';
    authAlreadyUser = 'Ya eres un usuario?';
    authNeedAccount = 'Necesitas una cuenta?';
    authOptionsTitle = 'O usa';

    //sign in
    signInTitle = 'Inicia sesión';
    signInButtonText = 'Iniciar';

    //sign up
    signUpTitle = 'Registrate';
    signUpButtonText = 'Registrate';

    //others
    themeSelectorTitle = 'Selector de tema';
    languageSelectorTitle = 'Selector de lenguaje';
  }

  LanguageEsCo.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}
