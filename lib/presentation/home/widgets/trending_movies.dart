import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/configs/assets/app_images.dart';
import 'package:movie_app/domain/home/entities/trending_movie.dart';

class TrendingMovies extends StatelessWidget {
  final List<TrendingMovie> movies;
  const TrendingMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return FanCarouselImageSlider.sliderType1(
      imagesLink: movies
          .map((movie) => '${AppImages.movieImageBasePath}${movie.posterPath}')
          .toList(),
      isAssets: false,
      autoPlay: true,
      sliderHeight: 350,
      showIndicator: true,
    );
  }
}
