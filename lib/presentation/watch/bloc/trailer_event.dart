part of 'trailer_bloc.dart';

@immutable
sealed class TrailerEvent {}

final class TrailerLoaded extends TrailerEvent {
  final int movieId;
  TrailerLoaded(this.movieId);
}
