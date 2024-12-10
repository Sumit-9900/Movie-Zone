import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/core/entities/movie.dart';
import 'package:movie_app/domain/home/usecases/get_now_playing_movies.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  NowPlayingBloc({required GetNowPlayingMovies getNowPlayingMovies})
      : _getNowPlayingMovies = getNowPlayingMovies,
        super(NowPlayingInitial()) {
    on<NowPlayingEvent>((event, emit) => emit(NowPlayingLoading()));
    on<NowPlayingLoaded>(_onNowPlayingLoaded);
  }

  void _onNowPlayingLoaded(
      NowPlayingLoaded event, Emitter<NowPlayingState> emit) async {
    final res = await _getNowPlayingMovies(NoParams());

    res.fold(
      (l) => emit(NowPlayingFailure(l.message)),
      (r) => emit(NowPlayingSuccess(r)),
    );
  }
}
