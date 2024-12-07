import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/home/entities/trending_movie.dart';
import 'package:movie_app/domain/home/repositories/home_repositories.dart';

class GetTrendingMovies implements Usecase<List<TrendingMovie>, NoParams> {
  final HomeRepositories homeRepositories;
  GetTrendingMovies(this.homeRepositories);

  @override
  Future<Either<Failure, List<TrendingMovie>>> call(NoParams params) async {
    return await homeRepositories.getTrendingMovies();
  }
}
