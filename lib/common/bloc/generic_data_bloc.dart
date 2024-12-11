import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/usecase.dart';

part 'generic_data_event.dart';
part 'generic_data_state.dart';

class GenericDataBloc<T> extends Bloc<GenericDataEvent, GenericDataState> {
  GenericDataBloc() : super(GenericDataInitial()) {
    on<GenericDataEvent>((event, emit) => emit(GenericDataLoading()));
    on<GenericDataLoaded<T, dynamic>>(_onGenericDataLoaded);
  }

  void _onGenericDataLoaded(
      GenericDataLoaded<T, dynamic> event, Emitter<GenericDataState> emit) async {
    final res = await event.usecase(event.params);

    res.fold(
      (l) => emit(GenericDataFailure(l.message)),
      (r) => emit(GenericDataSuccess<T>(r)),
    );
  }
}
