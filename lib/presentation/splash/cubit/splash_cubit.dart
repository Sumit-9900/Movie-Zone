import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/is_user_logged_in.dart';
import 'package:movie_app/core/usecase/usecase_type.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final IsUserLoggedIn _isUserLoggedIn;
  SplashCubit({required IsUserLoggedIn isUserLoggedIn})
      : _isUserLoggedIn = isUserLoggedIn,
        super(SplashInitial());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await _isUserLoggedIn(NoParams());

    if (isLoggedIn) {
      emit(SplashAuthenticated());
    } else {
      emit(SplashUnAuthenticated());
    }
  }
}
