import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/core/models/trailer_model.dart';

abstract interface class WatchRemoteDataSource {
  Future<TrailerModel> getMovieTrailer(int movieId);
  Future<List<MovieModel>> getMovieRecommendations(int movieId);
  Future<List<MovieModel>> getMovieSimilars(int movieId);
}

class WatchRemoteDataSourceImpl implements WatchRemoteDataSource {
  final Dio dio;
  WatchRemoteDataSourceImpl(this.dio);

  @override
  Future<TrailerModel> getMovieTrailer(int movieId) async {
    try {
      final response = await dio.get('${ApiUrl.movieApiV}/$movieId/trailer');
      final data = Map<String, dynamic>.from(response.data['trailer']);
      return TrailerModel.fromJson(data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ServerException('Connection timeout. Please try again later.');
      }
      throw ServerException(e.response!.data['message']);
    }
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(int movieId) async {
    try {
      final response =
          await dio.get('${ApiUrl.movieApiV}/$movieId/recommendations');
      final data = List<Map<String, dynamic>>.from(response.data['content']);
      final movies = data.map((movie) => MovieModel.fromJson(movie)).toList();
      return movies;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ServerException('Connection timeout. Please try again later.');
      }
      throw ServerException(e.response!.data['message']);
    }
  }
  
  @override
  Future<List<MovieModel>> getMovieSimilars(int movieId) async {
    try {
      final response =
          await dio.get('${ApiUrl.movieApiV}/$movieId/similar');
      final data = List<Map<String, dynamic>>.from(response.data['content']);
      final movies = data.map((movie) => MovieModel.fromJson(movie)).toList();
      return movies;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ServerException('Connection timeout. Please try again later.');
      }
      throw ServerException(e.response!.data['message']);
    }
  }
}
