part of 'recommendations_bloc.dart';

@immutable
sealed class RecommendationsEvent {}

final class RecommendationsLoaded extends RecommendationsEvent {
  final int movieId;
  RecommendationsLoaded(this.movieId);
}
