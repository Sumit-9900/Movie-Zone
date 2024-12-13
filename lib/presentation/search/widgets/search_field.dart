import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic_data_bloc.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/domain/search/usecases/get_searched_movies.dart';
import 'package:movie_app/init_dependencies_imports.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  const SearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search...',
        suffixIcon: IconButton(
          onPressed: () {
            if (controller.text.trim().isNotEmpty) {
              context.read<GenericDataBloc<List<Movie>>>().add(
                    GenericDataLoaded(
                      serviceLocator<GetSearchedMovies>(),
                      controller.text.trim(),
                    ),
                  );
            }
          },
          icon: const Icon(Icons.done),
        ),
      ),
    );
  }
}
