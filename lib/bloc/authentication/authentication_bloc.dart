import 'package:cobro_app/models/user/user_model.dart';
import 'package:cobro_app/repository/authentication/authentication_repository.dart';
import 'package:cobro_app/services/authentication/authentication_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService service;
  final AuthenticationRepository repository;
  AuthenticationBloc({
    required this.service,
    required this.repository,
  }) : super(const AuthenticationState()) {
    on<SigninWithEmail>((event, emit) => _signInWithGmail());
    on<SignOut>((event, emit) => _signOut());
    on<SignUpWithForm>(
      (event, emit) {
        return _signUpWithForm(event.user, event.password);
      },
    );
  }

  _signInWithGmail() async {
    await service.signInGoogle();
  }

  _signUpWithForm(UserModel user, String password) async {
    await service.signUpWithForm(
      userData: user,
      password: password,
    );
  }

  _signOut() async {
    service.signOut();
  }
}
