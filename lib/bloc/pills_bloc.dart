import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/logic/repository.dart';
import 'package:pills/models/pills_model.dart';

part 'pills_event.dart';
part 'pills_state.dart';

class PillsBloc extends Bloc<PillsEvent, PillsState> {
  final Repository repository;
  PillsBloc({required this.repository}) : super(PillsState()) {
    on<FetchPillsEvent>(_onFetchAntibiotics);
  }
FutureOr<void> _onFetchAntibiotics(
    FetchPillsEvent event, Emitter<PillsState> emit) async {
  print("event called1");
  
  // Emit the loading state
  emit(state.copyWith(status: PillsStatus.loading));

  try {
    // Await the fetch operation
    final pills = await repository.fetchPills(event.category);
    
    // Emit the success state with the fetched pills
    emit(state.copyWith(pills: pills, status: PillsStatus.success));
  } catch (e) {
    // Log the error for debugging
    print("Error fetching pills: $e");

    // Emit the failure state with the error message
    emit(state.copyWith(status: PillsStatus.failure, failure: e.toString()));
  }
}


}
