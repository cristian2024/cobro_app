part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.currentUserData,
  });

  final UserModel? currentUserData;

  @override
  List<Object> get props => [
        currentUserData ?? '',
      ];
}
