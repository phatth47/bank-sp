import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_event.dart';

part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<DataInitialEvent>(_mapInitEventToState);
  }

  Future<void> _mapInitEventToState(
    DataInitialEvent event,
    emit,
  ) async {
    try {
      emit(DataLoading());
      await Future.delayed(const Duration(seconds: 2));
      return emit(DataLoaded());
    } catch (_) {
      return emit(DataError());
    }
  }
}
