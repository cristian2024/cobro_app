import 'package:cobro_app/utils/email_utils.dart';

class Validators {
  static String? passwordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'somethin';
      
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (!EmailUtils.validate(email ?? '')) {
      return 'somethin';
    }
    return null;
  }
}
