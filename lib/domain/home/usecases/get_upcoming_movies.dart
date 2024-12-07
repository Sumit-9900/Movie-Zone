import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/home/entities/upcoming_movie.dart';
import 'package:movie_app/domain/home/repositories/home_repositories.dart';

class GetUpcomingMovies implements Usecase<List<UpcomingMovie>, NoParams> {
  final HomeRepositories homeRepositories;
  GetUpcomingMovies(this.homeRepositories);

  @override
  Future<Either<Failure, List<UpcomingMovie>>> call(NoParams params) async {
    return await homeRepositories.getUpcomingMovies();
  }
}
