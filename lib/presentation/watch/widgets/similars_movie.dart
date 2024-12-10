import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/loader.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/presentation/home/widgets/movie_card.dart';
import 'package:movie_app/presentation/watch/bloc/similars_bloc.dart';

class SimilarsMovie extends StatefulWidget {
  final Movie movie;
  const SimilarsMovie({super.key, required this.movie});

  @override
  State<SimilarsMovie> createState() => _SimilarsMovieState();
}

class _SimilarsMovieState extends State<SimilarsMovie> {
  @override
  void initState() {
    super.initState();
    context.read<SimilarsBloc>().add(SimilarsLoaded(widget.movie.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarsBloc, SimilarsState>(
      builder: (context, state) {
        if (state is SimilarsLoading) {
          return const SizedBox(height: 200, child: Loader());
        } else if (state is SimilarsFailure) {
          return Center(
            child: Text(state.message),
          );
        }else if(state is SimilarsSuccess){

        return MovieCard(movies: state.movies, horizontalPadding: 0);
        }
        return Container();
      },
    );
  }
}
