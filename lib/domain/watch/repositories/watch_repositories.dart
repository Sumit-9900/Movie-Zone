import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/core/entities/trailer.dart';
import 'package:movie_app/core/error/failure.dart';

abstract interface class WatchRepositories {
  Future<Either<Failure, Trailer>> getMovieTrailer(int movieId);
  Future<Either<Failure, List<Movie>>> getMovieRecommendations(int movieId);
  Future<Either<Failure, List<Movie>>> getMovieSimilars(int movieId);
}
