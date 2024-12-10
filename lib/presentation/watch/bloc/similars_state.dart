part of 'similars_bloc.dart';

@immutable
sealed class SimilarsState {}

final class SimilarsInitial extends SimilarsState {}

final class SimilarsLoading extends SimilarsState {}

final class SimilarsSuccess extends SimilarsState {
  final List<Movie> movies;
  SimilarsSuccess(this.movies);
}

final class SimilarsFailure extends SimilarsState {
  final String message;
  SimilarsFailure(this.message);
}
