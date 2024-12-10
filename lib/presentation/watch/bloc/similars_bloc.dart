import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/domain/watch/usecases/get_movie_similars.dart';

part 'similars_event.dart';
part 'similars_state.dart';

class SimilarsBloc extends Bloc<SimilarsEvent, SimilarsState> {
  final GetMovieSimilars _getMovieSimilars;
  SimilarsBloc({required GetMovieSimilars getMovieSimilars})
      : _getMovieSimilars = getMovieSimilars,
        super(SimilarsInitial()) {
    on<SimilarsEvent>((event, emit) => emit(SimilarsLoading()));
    on<SimilarsLoaded>(_onSimilarsLoaded);
  }

  void _onSimilarsLoaded(
      SimilarsLoaded event, Emitter<SimilarsState> emit) async {
    final res = await _getMovieSimilars(event.movieId);

    res.fold(
      (l) => emit(SimilarsFailure(l.message)),
      (r) => emit(SimilarsSuccess(r)),
    );
  }
}
