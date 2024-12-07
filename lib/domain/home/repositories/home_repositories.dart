import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/home/entities/now_playing_movie.dart';
import 'package:movie_app/domain/home/entities/trending_movie.dart';
import 'package:movie_app/domain/home/entities/upcoming_movie.dart';

abstract interface class HomeRepositories {
  Future<Either<Failure, List<TrendingMovie>>> getTrendingMovies();
  Future<Either<Failure, List<NowPlayingMovie>>> getNowPlayingMovies();
  Future<Either<Failure, List<UpcomingMovie>>> getUpcomingMovies();
}
