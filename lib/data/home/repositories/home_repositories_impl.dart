import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/data/home/datasources/home_remote_data_source.dart';
import 'package:movie_app/domain/home/entities/now_playing_movie.dart';
import 'package:movie_app/domain/home/entities/trending_movie.dart';
import 'package:movie_app/domain/home/entities/upcoming_movie.dart';
import 'package:movie_app/domain/home/repositories/home_repositories.dart';

class HomeRepositoriesImpl implements HomeRepositories {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoriesImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, List<NowPlayingMovie>>> getNowPlayingMovies() async {
    try {
      final nowPlayingMovies = await homeRemoteDataSource.nowPlayingMovies();

      return right(nowPlayingMovies);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<TrendingMovie>>> getTrendingMovies() async {
    try {
      final trendingMovies = await homeRemoteDataSource.trendingMovies();

      return right(trendingMovies);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<UpcomingMovie>>> getUpcomingMovies() async {
    try {
      final upcomingMovies = await homeRemoteDataSource.upcomingMovies();

      return right(upcomingMovies);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
