import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/home/entities/upcoming_movie.dart';
import 'package:movie_app/domain/home/usecases/get_upcoming_movies.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final GetUpcomingMovies _getUpcomingMovies;
  UpcomingBloc({required GetUpcomingMovies getUpcomingMovies})
      : _getUpcomingMovies = getUpcomingMovies,
        super(UpcomingInitial()) {
    on<UpcomingEvent>((event, emit) => emit(UpcomingLoading()));
    on<UpcomingLoaded>(_onUpcomingLoaded);
  }

  void _onUpcomingLoaded(
      UpcomingLoaded event, Emitter<UpcomingState> emit) async {
    final res = await _getUpcomingMovies(NoParams());

    res.fold(
      (l) => emit(UpcomingFailure(l.message)),
      (r) => emit(UpcomingSuccess(r)),
    );
  }
}
