import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/auth/entities/auth_params.dart';
import 'package:movie_app/domain/auth/entities/user_response.dart';

abstract interface class AuthRepositories {
  Future<Either<Failure, UserResponse>> signUp(AuthParams params);

  Future<Either<Failure, UserResponse>> logIn(AuthParams params);

  Future<bool> isLoggedIn();
}
