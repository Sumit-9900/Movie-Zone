part of 'now_playing_bloc.dart';

@immutable
sealed class NowPlayingState {}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}

final class NowPlayingSuccess extends NowPlayingState {
  final List<NowPlayingMovie> movies;
  NowPlayingSuccess(this.movies);
}

final class NowPlayingFailure extends NowPlayingState {
  final String message;
  NowPlayingFailure(this.message);
}

