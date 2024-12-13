import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/auth/repositories/auth_repositories.dart';

class UserLogOut implements Usecase<bool, NoParams> {
  final AuthRepositories authRepositories;
  UserLogOut(this.authRepositories);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await authRepositories.logOut();
  }
}
