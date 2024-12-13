import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic_data_bloc.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/loader.dart';
import 'package:movie_app/core/configs/assets/app_images.dart';
import 'package:movie_app/core/configs/theme/app_colors.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/presentation/watch/pages/watch_page.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericDataBloc<List<Movie>>, GenericDataState>(
      builder: (context, state) {
        if (state is GenericDataLoading) {
          return const SizedBox(height: 200, child: Loader());
        } else if (state is GenericDataFailure) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is GenericDataSuccess<List<Movie>>) {
          return GridView.builder(
            itemCount: state.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return _movieCard(state.data[index], context);
            },
          );
        }
        return Container();
      },
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
