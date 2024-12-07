import 'package:movie_app/core/usecase/usecase_type.dart';
import 'package:movie_app/domain/auth/repositories/auth_repositories.dart';

class IsUserLoggedIn implements UsecaseType<bool, NoParams> {
  final AuthRepositories authRepositories;
  IsUserLoggedIn(this.authRepositories);

  @override
  Future<bool> call(NoParams params) async {
    return await authRepositories.isLoggedIn();
  }
}
