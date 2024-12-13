import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic_data_bloc.dart';
import 'package:movie_app/common/widgets/loader.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/domain/watch/usecases/get_movie_similars.dart';
import 'package:movie_app/init_dependencies_imports.dart';
import 'package:movie_app/common/widgets/movie_card.dart';

class SimilarsMovie extends StatelessWidget {
  final Movie movie;
  const SimilarsMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataBloc<List<Movie>>()
        ..add(
          GenericDataLoaded(serviceLocator<GetMovieSimilars>(), movie.id),
        ),
      child: BlocBuilder<GenericDataBloc<List<Movie>>, GenericDataState>(
        builder: (context, state) {
          if (state is GenericDataLoading) {
            return const SizedBox(height: 200, child: Loader());
          } else if (state is GenericDataFailure) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is GenericDataSuccess<List<Movie>>) {
            return MovieCard(movies: state.data, horizontalPadding: 0);
          }
          return Container();
        },
      ),
    );
  }
}
