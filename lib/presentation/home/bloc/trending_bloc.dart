import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/home/entities/trending_movie.dart';
import 'package:movie_app/domain/home/usecases/get_trending_movies.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final GetTrendingMovies _getTrendingMovies;
  TrendingBloc({required GetTrendingMovies getTrendingMovies})
      : _getTrendingMovies = getTrendingMovies,
        super(TrendingInitial()) {
    on<TrendingEvent>((event, emit) => emit(TrendingLoading()));
    on<TrendingLoaded>(_onTrendingLoaded);
  }

  void _onTrendingLoaded(
      TrendingLoaded event, Emitter<TrendingState> emit) async {
    final res = await _getTrendingMovies(NoParams());

    res.fold(
      (l) => emit(TrendingFailure(l.message)),
      (r) => emit(TrendingSuccess(r)),
    );
  }
}
