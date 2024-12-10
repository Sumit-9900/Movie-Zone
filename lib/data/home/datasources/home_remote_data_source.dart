import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/data/home/models/trending_movie_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<TrendingMovieModel>> trendingMovies();
  Future<List<MovieModel>> nowPlayingMovies();
  Future<List<MovieModel>> upcomingMovies();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;
  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<MovieModel>> nowPlayingMovies() async {
    try {
      final response = await dio.get(ApiUrl.nowPlayingMovies);
      final data = Map<String, dynamic>.from(response.data);
      final movies = List<Map<String, dynamic>>.from(data['content'])
          .map(
            (movie) => MovieModel.fromJson(movie),
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
  Future<List<MovieModel>> upcomingMovies() async {
    try {
      final response = await dio.get(ApiUrl.upcomingMovies);
      final data = Map<String, dynamic>.from(response.data);
      final movies = List<Map<String, dynamic>>.from(data['content'])
          .map(
            (movie) => MovieModel.fromJson(movie),
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
