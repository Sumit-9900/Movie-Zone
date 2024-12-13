import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/auth/entities/auth_params.dart';
import 'package:movie_app/domain/auth/entities/log_in.dart';
import 'package:movie_app/domain/auth/repositories/auth_repositories.dart';

class UserLogIn implements Usecase<LogIn, AuthParams> {
  final AuthRepositories authRepositories;
  UserLogIn(this.authRepositories);

  @override
  Future<Either<Failure, LogIn>> call(AuthParams params) async {
    return await authRepositories.logIn(params);
  }
}
