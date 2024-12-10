part of 'similars_bloc.dart';

@immutable
sealed class SimilarsEvent {}

final class SimilarsLoaded extends SimilarsEvent {
  final int movieId;
  SimilarsLoaded(this.movieId);
}
