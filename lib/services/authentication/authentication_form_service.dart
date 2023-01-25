part of 'authentication_service.dart';

extension FormAuth on AuthenticationService {
  Future<User?> signUpWithForm({
    required UserModel userData,
    required String password,
  }) async {
    try {
      logg(
        'Login via form',
        TAG: AuthenticationService.TAG,
      );

      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: userData.email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        return _currentSignin(user);
      }
    } on FirebaseAuthException catch (e) {
      AuthCodeConverter.throwCodeToException(e.code);
    }
    return null;
  }
}
