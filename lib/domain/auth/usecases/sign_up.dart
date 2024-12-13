import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/auth/entities/auth_params.dart';
import 'package:movie_app/domain/auth/entities/sign_up.dart';
import 'package:movie_app/domain/auth/repositories/auth_repositories.dart';

class UserSignUp implements Usecase<SignUp, AuthParams> {
  final AuthRepositories authRepositories;
  UserSignUp(this.authRepositories);

  @override
  Future<Either<Failure, SignUp>> call(AuthParams params) async {
    return await authRepositories.signUp(params);
  }
}
