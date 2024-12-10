import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entities/trailer.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/watch/repositories/watch_repositories.dart';

class GetMovieTrailer implements Usecase<Trailer, int> {
  final WatchRepositories watchRepositories;
  GetMovieTrailer(this.watchRepositories);

  @override
  Future<Either<Failure, Trailer>> call(int movieId) async {
    return await watchRepositories.getMovieTrailer(movieId);
  }
}
