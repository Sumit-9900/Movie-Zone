import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/watch/usecases/get_movie_trailer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'trailer_event.dart';
part 'trailer_state.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState> {
  final GetMovieTrailer _getMovieTrailer;
  YoutubePlayerController? _youtubePlayerController;
  TrailerBloc({required GetMovieTrailer getMovieTrailer})
      : _getMovieTrailer = getMovieTrailer,
        super(TrailerInitial()) {
    on<TrailerEvent>((event, emit) => emit(TrailerLoading()));
    on<TrailerLoaded>(_onTrailerLoaded);
  }

  void _onTrailerLoaded(TrailerLoaded event, Emitter<TrailerState> emit) async {
    final res = await _getMovieTrailer(event.movieId);

    res.fold(
      (l) => emit(TrailerFailure(l.message)),
      (r) {
        _youtubePlayerController = YoutubePlayerController(
          initialVideoId: r.key,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        );

        emit(TrailerSuccess(_youtubePlayerController!));
      },
    );
  }

  @override
  Future<void> close() {
    _youtubePlayerController?.dispose();
    return super.close();
  }
}
