part of 'recommendations_bloc.dart';

@immutable
sealed class RecommendationsState {}

final class RecommendationsInitial extends RecommendationsState {}

final class RecommendationsLoading extends RecommendationsState {}

final class RecommendationsSuccess extends RecommendationsState {
  final List<Movie> movies;
  RecommendationsSuccess(this.movies);
}

final class RecommendationsFailure extends RecommendationsState {
  final String message;
  RecommendationsFailure(this.message);
}
