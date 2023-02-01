part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SigninWithEmail extends AuthenticationEvent {}

class SignUpWithFormEvent extends AuthenticationEvent {
  final UserModel user;
  final String password;

  const SignUpWithFormEvent({
    required this.user,
    required this.password,
  });
}

class SignInWithFormEvent extends AuthenticationEvent {
  final UserModel user;
  final String password;

  const SignInWithFormEvent({
    required this.user,
    required this.password,
  });
}

class SignOutEvent extends AuthenticationEvent {}
