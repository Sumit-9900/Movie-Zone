import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/domain/home/entities/trending_movie.dart';

abstract interface class HomeRepositories {
  Future<Either<Failure, List<TrendingMovie>>> getTrendingMovies();
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getUpcomingMovies();
}
