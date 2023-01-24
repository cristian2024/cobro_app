// ignore_for_file: file_names
import 'package:cobro_app/languages/language.dart';

class LanguageEnUs extends Language {
  @override
  String get languageName => 'US english';

  @override
  String get countryCode => 'US';

  LanguageEnUs() {
    //app basics
    appBarTitle1 = 'Cobro app';
    settingsTooltipText = 'App settings';

    signInTitle = 'Sign in';
    signInButtonText = 'Sign in';

    //auth
    authPasswordLabel = 'Password';
    authUserLabel = 'Username/email';
    authOptionsTitle = 'Or use';
    authAlreadyUser = 'Already a user?';
    authNeedAccount = 'Need an account?';

    //signup
    signUpButtonText = 'Sign up';
    signUpTitle = 'Sign up';

    //others
    themeSelectorTitle = 'Theme selector';
    languageSelectorTitle = 'Language selector';
  }

  LanguageEnUs.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}
