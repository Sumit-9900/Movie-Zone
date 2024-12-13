import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/auth/entities/auth_params.dart';
import 'package:movie_app/domain/auth/usecases/log_in.dart';
import 'package:movie_app/domain/auth/usecases/log_out.dart';
import 'package:movie_app/domain/auth/usecases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogIn _userLogIn;
  AuthBloc(
      {required UserSignUp userSignUp,
      required UserLogIn userLogIn,
      required UserLogOut userLogOut})
      : _userSignUp = userSignUp,
        _userLogIn = userLogIn,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogIn>(_onAuthLogIn);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final res = await _userSignUp(
      AuthParams(
        email: event.params.email,
        password: event.params.password,
      ),
    );

    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthSuccess()),
    );
  }

  void _onAuthLogIn(AuthLogIn event, Emitter<AuthState> emit) async {
    final res = await _userLogIn(
      AuthParams(
        email: event.params.email,
        password: event.params.password,
      ),
    );

    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthSuccess()),
    );
  }
}
