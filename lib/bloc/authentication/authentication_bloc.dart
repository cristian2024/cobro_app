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
  }) : super(AuthenticationInitial()) {
    on<SigninWithEmail>((event, emit) => _signInWithGmail());
    on<SignOut>((event, emit) => _signOut());
  }

  _signInWithGmail() async {
    await service.signInGoogle();
  }

  _signOut() async {
    service.signOut();
  }
}
