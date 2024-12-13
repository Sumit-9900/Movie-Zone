import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/models/movie_model.dart';

abstract interface class SearchRemoteDataSource {
  Future<List<MovieModel>> searchMovies(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio dio;
  SearchRemoteDataSourceImpl(this.dio);

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      final response = await dio.get('${ApiUrl.searchMovies}$query');
      final data = Map<String, dynamic>.from(response.data);
      final movies = List<Map<String, dynamic>>.from(data['content'])
          .map(
            (movie) => MovieModel.fromJson(movie),
          )
          .toList();

      return movies;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw ServerException('Connection timeout. Please try again later.');
      }
      throw ServerException(e.response!.data['message']);
    }
  }
}
