part of 'now_playing_bloc.dart';

@immutable
sealed class NowPlayingEvent {}

final class NowPlayingLoaded extends NowPlayingEvent {}
