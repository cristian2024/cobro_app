import 'package:cobro_app/exceptions/authentication/auth_exceptions.dart';
import 'package:cobro_app/services/authentication/authentication_service.dart';

class AuthCodeConverter {
  static throwCodeToException(String code) {
    switch (code) {
      case AuthenticationService.emailAlreadyInUse:
        throw EmailAlreadyInUse();
      default:
        AuthException();
    }
  }
}
