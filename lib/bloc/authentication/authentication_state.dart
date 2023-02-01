part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.currentUserData,
    this.status = ReqStatus.noSubmitted,
    this.exception,
  });

  final UserModel? currentUserData;
  final ReqStatus status;
  final AuthException? exception;
  

  @override
  List<Object> get props => [
        currentUserData ?? '',
        status,
        exception??'',
      ];

  AuthenticationState copyWith({
    UserModel? currentUserData,
    ReqStatus? status,
    AuthException? exception,
  }) {
    return AuthenticationState(
      currentUserData: currentUserData ?? this.currentUserData,
      status: status ?? this.status,
      exception: exception,
    );
  }
}
