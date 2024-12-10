import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/core/entities/trailer.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/data/watch/datasources/watch_remote_data_source.dart';
import 'package:movie_app/domain/watch/repositories/watch_repositories.dart';

class WatchRepositoriesImpl implements WatchRepositories {
  final WatchRemoteDataSource watchRemoteDataSource;
  WatchRepositoriesImpl(this.watchRemoteDataSource);

  @override
  Future<Either<Failure, Trailer>> getMovieTrailer(int movieId) async {
    try {
      final movieTrailer = await watchRemoteDataSource.getMovieTrailer(movieId);

      return right(movieTrailer);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovieRecommendations(
      int movieId) async {
    try {
      final movies =
          await watchRemoteDataSource.getMovieRecommendations(movieId);

      return right(movies);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovieSimilars(int movieId) async {
    try {
      final movies =
          await watchRemoteDataSource.getMovieSimilars(movieId);

      return right(movies);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
