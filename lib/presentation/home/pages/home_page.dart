import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/bloc/generic_data_bloc.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/loader.dart';
import 'package:movie_app/core/configs/assets/app_vectors.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/core/utils/dialog_box.dart';
import 'package:movie_app/domain/home/entities/trending_movie.dart';
import 'package:movie_app/domain/home/usecases/get_now_playing_movies.dart';
import 'package:movie_app/domain/home/usecases/get_trending_movies.dart';
import 'package:movie_app/domain/home/usecases/get_upcoming_movies.dart';
import 'package:movie_app/init_dependencies_imports.dart';
import 'package:movie_app/presentation/auth/pages/signin_page.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/common/widgets/movie_card.dart';
import 'package:movie_app/presentation/home/widgets/trending_movies.dart';
import 'package:movie_app/presentation/search/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataBloc<bool>(),
      child: BlocConsumer<GenericDataBloc<bool>, GenericDataState>(
        listener: (context, state) {
          if (state is GenericDataSuccess<bool>) {
            if (state.data == true) {
              AppNavigation.pushAndRemoveUntil(context, const SigninPage());
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: SvgPicture.asset(AppVectors.logo),
              leading: IconButton(
                onPressed: () {
                  showPopup(context);
                },
                icon: const Icon(Icons.logout),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    AppNavigation.push(context, const SearchPage());
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            body: (state is GenericDataFailure)
                ? errorText(state.message)
                : (state is GenericDataLoading)
                    ? const Loader()
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CategoryText(title: 'Trendings 🔥'),
                            BlocProvider(
                              create: (context) =>
                                  GenericDataBloc<List<TrendingMovie>>()
                                    ..add(
                                      GenericDataLoaded(
                                          serviceLocator<GetTrendingMovies>(),
                                          NoParams()),
                                    ),
                              child: BlocBuilder<
                                  GenericDataBloc<List<TrendingMovie>>,
                                  GenericDataState>(
                                builder: (context, state) {
                                  if (state is GenericDataFailure) {
                                    return SizedBox(
                                      height: 250,
                                      child: errorText(state.message),
                                    );
                                  } else if (state is GenericDataLoading) {
                                    return const SizedBox(
                                        height: 250, child: Loader());
                                  } else if (state is GenericDataSuccess<
                                      List<TrendingMovie>>) {
                                    return TrendingMovies(movies: state.data);
                                  }
                                  return Container();
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            const CategoryText(title: 'Now Playing'),
                            BlocProvider(
                              create: (context) =>
                                  GenericDataBloc<List<Movie>>()
                                    ..add(
                                      GenericDataLoaded(
                                          serviceLocator<GetNowPlayingMovies>(),
                                          NoParams()),
                                    ),
                              child: BlocBuilder<GenericDataBloc<List<Movie>>,
                                  GenericDataState>(
                                builder: (context, state) {
                                  if (state is GenericDataFailure) {
                                    return SizedBox(
                                      height: 200,
                                      child: errorText(state.message),
                                    );
                                  } else if (state is GenericDataLoading) {
                                    return const SizedBox(
                                        height: 200, child: Loader());
                                  } else if (state
                                      is GenericDataSuccess<List<Movie>>) {
                                    return MovieCard(movies: state.data);
                                  }
                                  return Container();
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            const CategoryText(title: 'Upcoming'),
                            BlocProvider(
                              create: (context) =>
                                  GenericDataBloc<List<Movie>>()
                                    ..add(
                                      GenericDataLoaded(
                                          serviceLocator<GetUpcomingMovies>(),
                                          NoParams()),
                                    ),
                              child: BlocBuilder<GenericDataBloc<List<Movie>>,
                                  GenericDataState>(
                                builder: (context, state) {
                                  if (state is GenericDataFailure) {
                                    return SizedBox(
                                      height: 200,
                                      child: errorText(state.message),
                                    );
                                  } else if (state is GenericDataLoading) {
                                    return const SizedBox(
                                        height: 200, child: Loader());
                                  } else if (state
                                      is GenericDataSuccess<List<Movie>>) {
                                    return MovieCard(movies: state.data);
                                  }
                                  return Container();
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
          );
        },
      ),
    );
  }

  Widget errorText(String message) {
    return Center(
      child: Text('$message !!!'),
    );
  }
}
