import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/watch/repositories/watch_repositories.dart';

class GetMovieRecommendations implements Usecase<List<Movie>, int> {
  final WatchRepositories watchRepositories;
  GetMovieRecommendations(this.watchRepositories);

  @override
  Future<Either<Failure, List<Movie>>> call(int movieId) async {
    return await watchRepositories.getMovieRecommendations(movieId);
  }
}
