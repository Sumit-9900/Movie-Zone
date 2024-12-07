import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/data/home/models/now_playing_movie_model.dart';
import 'package:movie_app/data/home/models/trending_movie_model.dart';
import 'package:movie_app/data/home/models/upcoming_movie_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<TrendingMovieModel>> trendingMovies();
  Future<List<NowPlayingMovieModel>> nowPlayingMovies();
  Future<List<UpcomingMovieModel>> upcomingMovies();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;
  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<NowPlayingMovieModel>> nowPlayingMovies() async {
    try {
      final response = await dio.get(ApiUrl.nowPlayingMovies);
      final data = Map<String, dynamic>.from(response.data);
      final movies = List<Map<String, dynamic>>.from(data['content'])
          .map(
            (movie) => NowPlayingMovieModel.fromJson(movie),
          )
          .toList();

      return movies;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ServerException('Connection timeout. Please try again later.');
      }
      throw ServerException(e.response!.data['message']);
    }
  }

  @override
  Future<List<TrendingMovieModel>> trendingMovies() async {
    try {
      final response = await dio.get(ApiUrl.trendingMovies);
      final data = Map<String, dynamic>.from(response.data);
      final movies = List<Map<String, dynamic>>.from(data['content'])
          .map(
            (movie) => TrendingMovieModel.fromJson(movie),
          )
          .toList();

      return movies;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ServerException('Connection timeout. Please try again later.');
      }
      throw ServerException(e.response!.data['message']);
    }
  }

  @override
  Future<List<UpcomingMovieModel>> upcomingMovies() async {
    try {
      final response = await dio.get(ApiUrl.upcomingMovies);
      final data = Map<String, dynamic>.from(response.data);
      final movies = List<Map<String, dynamic>>.from(data['content'])
          .map(
            (movie) => UpcomingMovieModel.fromJson(movie),
          )
          .toList();

      return movies;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ServerException('Connection timeout. Please try again later.');
      }
      throw ServerException(e.response!.data['message']);
    }
  }
}
