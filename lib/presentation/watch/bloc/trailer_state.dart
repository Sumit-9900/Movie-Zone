part of 'trailer_bloc.dart';

@immutable
sealed class TrailerState {}

final class TrailerInitial extends TrailerState {}

final class TrailerLoading extends TrailerState {}

final class TrailerSuccess extends TrailerState {
  final YoutubePlayerController controller;
  TrailerSuccess(this.controller);
}

final class TrailerFailure extends TrailerState {
  final String message;
  TrailerFailure(this.message);
}
