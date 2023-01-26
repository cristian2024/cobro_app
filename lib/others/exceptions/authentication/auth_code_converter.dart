import 'package:cobro_app/others/exceptions/authentication/auth_exceptions.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/services/authentication/authentication_service.dart';

class AuthConverter {
  static throwCodeToException(String code) {
    switch (code) {
      case AuthenticationService.emailAlreadyInUse:
        throw EmailAlreadyInUse();
      default:
        AuthException();
    }
  }

  static String getMessage(Language language, AuthException exception) {
    if (exception is EmailAlreadyInUse) {
      return language.emailAlreadyInUseText;
    }
    return language.authErrorText;
  }
}
