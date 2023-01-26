import 'package:cobro_app/bloc/bloc_config.dart';
import 'package:cobro_app/others/exceptions/authentication/auth_exceptions.dart';
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
    on<SigninWithEmail>((event, emit) => _signInWithGmail(emit));
    on<SignOut>((event, emit) => _signOut());
    on<SignUpWithFormEvent>(
      (event, emit) {
        return _signUpWithForm(
          emit,
          user: event.user,
          password: event.password,
        );
      },
    );
    on<SignInWithFormEvent>(
      (event, emit) {
        return _signInWithForm(
          emit,
          user: event.user,
          password: event.password,
        );
      },
    );
  }

  _signInWithGmail(
    Emitter<AuthenticationState> emit,
  ) async {
    emit(
      state.copyWith(status: ReqStatus.inProgress),
    );
    final user = await service.signInGoogle();
    emit(
      state.copyWith(
        currentUserData: UserModel.initial(
          email: user?.email ?? '',
          name: user?.displayName ?? '',
        ),
        status: ReqStatus.success,
      ),
    );
  }

  _signOut() async {
    service.signOut();
  }
}

extension FormMethods on AuthenticationBloc {
  _signUpWithForm(
    Emitter<AuthenticationState> emit, {
    required UserModel user,
    required String password,
  }) async {
    try {
      await service.signUpWithForm(
        userData: user,
        password: password,
      );

      emit(
        state.copyWith(
          status: ReqStatus.success,
          currentUserData: user,
        ),
      );
    } on AuthException catch (e) {
      emit(
        state.copyWith(
          status: ReqStatus.fail,
          exception: e,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ReqStatus.fail),
      );
    }
  }

  _signInWithForm(
    Emitter<AuthenticationState> emit, {
    required UserModel user,
    required String password,
  }) async {
    try {
      await service.signInWithForm(
        userData: user,
        password: password,
      );

      emit(
        state.copyWith(
          status: ReqStatus.success,
          currentUserData: user,
        ),
      );
    } on AuthException catch (e) {
      emit(
        state.copyWith(
          status: ReqStatus.fail,
          exception: e,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ReqStatus.fail),
      );
    }
  }
}
