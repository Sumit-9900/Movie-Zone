import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/configs/assets/app_images.dart';
import 'package:movie_app/core/configs/theme/app_colors.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/presentation/watch/pages/watch_page.dart';

class MovieCard extends StatelessWidget {
  final List<Movie> movies;
  final double horizontalPadding;
  const MovieCard({
    super.key,
    required this.movies,
    this.horizontalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        itemBuilder: (context, index) {
          return _movieCard(movies[index], context);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        itemCount: movies.length,
      ),
    );
  }

  Widget _movieCard(Movie movie, BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigation.push(context, WatchPage(movie: movie));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      '${AppImages.movieImageBasePath}${movie.posterPath}',
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        Text(
                          movie.voteAverage.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
