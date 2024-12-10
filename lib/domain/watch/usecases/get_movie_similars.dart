import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/watch/repositories/watch_repositories.dart';

class GetMovieSimilars implements Usecase<List<Movie>, int> {
  final WatchRepositories watchRepositories;
  GetMovieSimilars(this.watchRepositories);

  @override
  Future<Either<Failure, List<Movie>>> call(int movieId) async {
    return await watchRepositories.getMovieSimilars(movieId);
  }
}