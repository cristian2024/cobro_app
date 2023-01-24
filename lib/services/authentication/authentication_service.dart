// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:cobro_app/utils/logger.dart';

class AuthenticationService {
  // ignore: constant_identifier_names
  static const TAG = 'AUTHENTICATION SERVICE';

  final _auth = FirebaseAuth.instance;
  final GoogleSignIn google;
  AuthenticationService({
    required this.google,
  });

  Future<User?> signInGoogle() async {
    logg('Login with gmail', TAG: TAG);

    //launching gmail login pop up
    final googleSignin = await google.signIn();

    if (googleSignin == null) {
      logg('Signin couldnt be completed', TAG: TAG);
      throw Exception('Signin error');
    }
    //validating authentication of sign in
    final authentication = await googleSignin.authentication;

    //obtaining firebase usable credential
    final credential = GoogleAuthProvider.credential(
      accessToken: authentication.accessToken,
      idToken: authentication.idToken,
    );
    final userCredential = await _auth.signInWithCredential(credential);

    User? user = userCredential.user;

    if (user != null) {
      return _currentSignin(user);
    }
    return null;
  }

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
