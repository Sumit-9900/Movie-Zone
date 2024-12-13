import 'package:flutter/material.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/presentation/watch/widgets/recommendations_movie.dart';
import 'package:movie_app/presentation/watch/widgets/similars_movie.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';

class WatchPage extends StatelessWidget {
  final Movie movie;
  const WatchPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoPlayer(movieId: movie.id),
              const SizedBox(height: 16),
              _movieTitle(movie),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _movieDate(movie),
                  _movieRating(movie),
                ],
              ),
              const SizedBox(height: 16),
              _movieDescription(movie, context),
              const SizedBox(height: 16),
              _moviesText('Recommendation'),
              RecommendationsMovie(movie: movie),
              const SizedBox(height: 16),
              _moviesText('Similar'),
              SimilarsMovie(movie: movie),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _movieTitle(Movie movie) {
    return Text(
      movie.title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget _movieDate(Movie movie) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_month_outlined,
          size: 20,
          color: Colors.grey,
        ),
        const SizedBox(width: 5),
        Text(
          movie.releaseDate.toString().split(' ')[0],
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _movieRating(Movie movie) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(movie.voteAverage.toStringAsFixed(1)),
      ],
    );
  }

  Widget _movieDescription(Movie movie, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(movie.overview,
            style: Theme.of(context).primaryTextTheme.bodyMedium),
      ],
    );
  }

  Widget _moviesText(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
