part of 'generic_data_bloc.dart';

@immutable
sealed class GenericDataEvent {}

final class GenericDataLoaded<T, Params> extends GenericDataEvent {
  final Usecase<T, Params> usecase;
  final Params params;
  GenericDataLoaded(this.usecase, this.params);
}
