import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/widgets/loader.dart';
import 'package:movie_app/core/configs/assets/app_vectors.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_bloc.dart';
import 'package:movie_app/presentation/home/bloc/trending_bloc.dart';
import 'package:movie_app/presentation/home/bloc/upcoming_bloc.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_card.dart';
import 'package:movie_app/presentation/home/widgets/trending_movies.dart';
import 'package:movie_app/presentation/home/widgets/upcoming_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TrendingBloc>().add(TrendingLoaded());
    context.read<NowPlayingBloc>().add(NowPlayingLoaded());
    context.read<UpcomingBloc>().add(UpcomingLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategoryText(title: 'Trendings 🔥'),
            BlocBuilder<TrendingBloc, TrendingState>(
              builder: (context, state) {
                if (state is TrendingFailure) {
                  return Center(
                    child: Text('${state.message} !!!'),
                  );
                } else if (state is TrendingLoading) {
                  return const Loader();
                } else if (state is TrendingSuccess) {
                  return TrendingMovies(movies: state.movies);
                }
                return Container();
              },
            ),
            const SizedBox(height: 16),
            const CategoryText(title: 'Now Playing'),
            BlocBuilder<NowPlayingBloc, NowPlayingState>(
              builder: (context, state) {
                if (state is NowPlayingFailure) {
                  return Center(
                    child: Text('${state.message} !!!'),
                  );
                } else if (state is NowPlayingLoading) {
                  return const Loader();
                } else if (state is NowPlayingSuccess) {
                  return NowPlayingCard(movies: state.movies);
                }
                return Container();
              },
            ),
            const SizedBox(height: 16),
            const CategoryText(title: 'Upcoming'),
            BlocBuilder<UpcomingBloc, UpcomingState>(
              builder: (context, state) {
                if (state is UpcomingFailure) {
                  return Center(
                    child: Text('${state.message} !!!'),
                  );
                } else if (state is UpcomingLoading) {
                  return const Loader();
                } else if (state is UpcomingSuccess) {
                  return UpcomingCard(movies: state.movies);
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
