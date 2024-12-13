import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/auth/entities/auth_params.dart';
import 'package:movie_app/domain/auth/entities/log_in.dart';
import 'package:movie_app/domain/auth/entities/sign_up.dart';

abstract interface class AuthRepositories {
  Future<Either<Failure, SignUp>> signUp(AuthParams params);

  Future<Either<Failure, LogIn>> logIn(AuthParams params);

  Future<bool> isLoggedIn();

  Future<Either<Failure, bool>> logOut();
}
