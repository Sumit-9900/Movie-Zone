import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/data/auth/datasources/auth_local_data_source.dart';
import 'package:movie_app/data/auth/datasources/auth_remote_data_source.dart';
import 'package:movie_app/data/auth/models/auth_params_model.dart';
import 'package:movie_app/domain/auth/entities/auth_params.dart';
import 'package:movie_app/domain/auth/entities/log_in.dart';
import 'package:movie_app/domain/auth/entities/sign_up.dart';
import 'package:movie_app/domain/auth/repositories/auth_repositories.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepositoriesImpl(this.authRemoteDataSource, this.authLocalDataSource);

  @override
  Future<Either<Failure, LogIn>> logIn(AuthParams params) async {
    try {
      final user = await authRemoteDataSource.logIn(
        AuthParamsModel.fromEntity(params),
      );

      await authLocalDataSource.saveToken(user.data.token);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, SignUp>> signUp(AuthParams params) async {
    try {
      final user = await authRemoteDataSource.signUp(
        AuthParamsModel.fromEntity(params),
      );

      await authLocalDataSource.saveToken(user.data.token);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = authLocalDataSource.getToken();

    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      final isUserLoggedOut = await authLocalDataSource.clearToken();
      return right(isUserLoggedOut);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
