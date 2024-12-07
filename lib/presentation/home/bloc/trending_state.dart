part of 'trending_bloc.dart';

@immutable
sealed class TrendingState {}

final class TrendingInitial extends TrendingState {}

final class TrendingLoading extends TrendingState {}

final class TrendingSuccess extends TrendingState {
  final List<TrendingMovie> movies;
  TrendingSuccess(this.movies);
}

final class TrendingFailure extends TrendingState {
  final String message;
  TrendingFailure(this.message);
}
