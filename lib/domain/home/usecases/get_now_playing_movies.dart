import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/domain/home/repositories/home_repositories.dart';

class GetNowPlayingMovies implements Usecase<List<Movie>, NoParams> {
  final HomeRepositories homeRepositories;
  GetNowPlayingMovies(this.homeRepositories);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await homeRepositories.getNowPlayingMovies();
  }
}
