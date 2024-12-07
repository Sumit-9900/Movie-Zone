import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/data/auth/datasources/auth_remote_data_source.dart';
import 'package:movie_app/data/auth/models/auth_params_model.dart';
import 'package:movie_app/domain/auth/entities/auth_params.dart';
import 'package:movie_app/domain/auth/entities/user_response.dart';
import 'package:movie_app/domain/auth/repositories/auth_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoriesImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserResponse>> logIn(AuthParams params) async {
    try {
      final user = await authRemoteDataSource.logIn(
        AuthParamsModel.fromEntity(params),
      );

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.user.token);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserResponse>> signUp(AuthParams params) async {
    try {
      final user = await authRemoteDataSource.signUp(
        AuthParamsModel.fromEntity(params),
      );

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.user.token);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      return true;
    } else {
      return false;
    }
  }
}
