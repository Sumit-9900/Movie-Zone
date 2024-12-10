import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/loader.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/presentation/home/widgets/movie_card.dart';
import 'package:movie_app/presentation/watch/bloc/recommendations_bloc.dart';

class RecommendationsMovie extends StatefulWidget {
  final Movie movie;
  const RecommendationsMovie({super.key, required this.movie});

  @override
  State<RecommendationsMovie> createState() => _RecommendationsMovieState();
}

class _RecommendationsMovieState extends State<RecommendationsMovie> {
  @override
  void initState() {
    context
        .read<RecommendationsBloc>()
        .add(RecommendationsLoaded(widget.movie.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsBloc, RecommendationsState>(
      builder: (context, state) {
        if (state is RecommendationsLoading) {
          return const SizedBox(height: 200, child: Loader());
        } else if (state is RecommendationsFailure) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is RecommendationsSuccess) {
          return MovieCard(movies: state.movies, horizontalPadding: 0);
        }
        return Container();
      },
    );
  }
}
