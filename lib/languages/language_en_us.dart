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
    authEmailLabel = 'Email';
    authOptionsTitle = 'Or use';
    authAlreadyUser = 'Already a user?';
    authNeedAccount = 'Need an account?';

    signOutText = 'Sign out';

    //signup
    signUpButtonText = 'Sign up';
    signUpTitle = 'Sign up';

    //accounts
    accountDrawerText = 'Accounts';

    //others
    themeSelectorTitle = 'Theme selector';
    languageSelectorTitle = 'Language selector';

    //errors in forms
    notValidEmail = 'Please rewrite/complete with a correct email';
    notValidPassword = 'This is not a valid password';

    //exceptions
    emailAlreadyInUseText = 'This email is already taken';
    authErrorText = 'There was an unbounded authenticationError';
  }

  LanguageEnUs.fromMap(Map<String, dynamic> map) : super.fromMap(map);
}
