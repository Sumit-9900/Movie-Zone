import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/data/search/datasources/search_remote_data_source.dart';
import 'package:movie_app/domain/search/repositories/search_repositories.dart';

class SearchRepositoriesImpl implements SearchRepositories {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepositoriesImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final searchedMovies = await searchRemoteDataSource.searchMovies(query);

      return right(searchedMovies);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
