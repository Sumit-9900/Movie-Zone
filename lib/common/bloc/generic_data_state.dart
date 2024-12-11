part of 'generic_data_bloc.dart';

@immutable
sealed class GenericDataState {}

final class GenericDataInitial extends GenericDataState {}

final class GenericDataLoading extends GenericDataState {}

final class GenericDataSuccess<T> extends GenericDataState {
  final T data;
  GenericDataSuccess(this.data);
}

final class GenericDataFailure extends GenericDataState {
  final String message;
  GenericDataFailure(this.message);
}
