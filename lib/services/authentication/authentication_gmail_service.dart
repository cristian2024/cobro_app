part of  'authentication_service.dart';

extension GmailAuth on AuthenticationService {


  Future<User?> signInGoogle() async {
    logg('Login with gmail', TAG: AuthenticationService.TAG);

    //launching gmail login pop up
    final googleSignin = await google.signIn();

    if (googleSignin == null) {
      logg('Signin couldnt be completed', TAG: AuthenticationService.TAG);
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
}


