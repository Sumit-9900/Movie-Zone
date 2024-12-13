import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/search/repositories/search_repositories.dart';

class GetSearchedMovies implements Usecase<List<Movie>, String> {
  final SearchRepositories searchRepositories;
  GetSearchedMovies(this.searchRepositories);

  @override
  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await searchRepositories.searchMovies(query);
  }
}
