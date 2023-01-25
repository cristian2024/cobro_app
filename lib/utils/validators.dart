import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/utils/email_utils.dart';

class Validators {
  static String? passwordValidator(String? password, Language language) {
    if (password?.isEmpty ?? true) {
      return language.notValidPassword;
    }
    return null;
  }

  static String? emailValidator(String? email, Language language) {
    if (!EmailUtils.validate(email ?? '')) {
      return language.notValidEmail;
    }
    return null;
  }
}
