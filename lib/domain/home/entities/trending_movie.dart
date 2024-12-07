import 'package:movie_app/data/home/models/trending_movie_model.dart';

class TrendingMovie {
  final String backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final MediaType mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final DateTime releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  TrendingMovie({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}
