import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/domain/watch/usecases/get_movie_recommendations.dart';

part 'recommendations_event.dart';
part 'recommendations_state.dart';

class RecommendationsBloc
    extends Bloc<RecommendationsEvent, RecommendationsState> {
  final GetMovieRecommendations _getMovieRecommendations;
  RecommendationsBloc(
      {required GetMovieRecommendations getMovieRecommendations})
      : _getMovieRecommendations = getMovieRecommendations,
        super(RecommendationsInitial()) {
    on<RecommendationsEvent>((event, emit) => emit(RecommendationsLoading()));
    on<RecommendationsLoaded>(_onRecommendationsLoaded);
  }

  void _onRecommendationsLoaded(
      RecommendationsLoaded event, Emitter<RecommendationsState> emit) async {
    final res = await _getMovieRecommendations(event.movieId);

    res.fold(
      (l) => emit(RecommendationsFailure(l.message)),
      (r) => emit(RecommendationsSuccess(r)),
    );
  }
}
