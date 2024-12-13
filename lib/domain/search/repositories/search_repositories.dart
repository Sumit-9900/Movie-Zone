import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/core/error/failure.dart';

abstract interface class SearchRepositories {
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
}
