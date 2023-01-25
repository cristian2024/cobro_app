// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cobro_app/exceptions/authentication/auth_code_converter.dart';
import 'package:cobro_app/models/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:cobro_app/utils/logger.dart';

part 'authentication_form_service.dart';
part 'authentication_gmail_service.dart';

class AuthenticationService {
  // ignore: constant_identifier_names
  static const TAG = 'AUTHENTICATION SERVICE';

  //firebase auth error codes
  static const emailAlreadyInUse = 'email-already-in-use';

  final _auth = FirebaseAuth.instance;
  final GoogleSignIn google;
  AuthenticationService({
    required this.google,
  });

  Future<User?> _currentSignin(User user) async {
    assert(!user.isAnonymous);

    final currentUser = _auth.currentUser;
    if (currentUser?.uid != user.uid) {
      throw Exception('Users misunderstanding');
    }
    logg('User is signed', TAG: TAG);
    return currentUser;
  }

  Future<void> signOut() async {
    await google.signOut();
    await _auth.signOut();
  }
}
