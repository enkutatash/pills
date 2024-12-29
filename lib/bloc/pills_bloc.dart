// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:pills/logic/repository.dart';
// import 'package:pills/models/pills_model.dart';

// part 'pills_event.dart';
// part 'pills_state.dart';

// class PillsBloc extends Bloc<PillsEvent, PillsState> {
//   final Repository repository;
//   PillsBloc({required this.repository}) : super(PillsState()) {
//     on<FetchPillsEvent>(_onFetchAntibiotics);
//   }
// FutureOr<void> _onFetchAntibiotics(
//     FetchPillsEvent event, Emitter<PillsState> emit) async {
 
//   emit(state.copyWith(status: PillsStatus.loading));

//   try {
    
//     final pills = await repository.fetchPills(event.category);
    
//     emit(state.copyWith(pills: pills, status: PillsStatus.success));
//   } catch (e) {
    
//     emit(state.copyWith(status: PillsStatus.failure, failure: e.toString()));
//   }
// }


// }

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
    on<FetchPillsEvent>(_onFetchPills);
    on<SearchPillsEvent>(_onSearchPills); // Add listener for SearchPillsEvent
  }

  // Fetch pills based on category
  FutureOr<void> _onFetchPills(FetchPillsEvent event, Emitter<PillsState> emit) async {
    emit(state.copyWith(status: PillsStatus.loading));

    try {
      final pills = await repository.fetchPills(event.category);
      emit(state.copyWith(pills: pills, status: PillsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: PillsStatus.failure, failure: e.toString()));
    }
  }

  // Search pills based on query
FutureOr<void> _onSearchPills(SearchPillsEvent event, Emitter<PillsState> emit) async {
  if (event.query.isEmpty) {
    // When the search query is empty, return the full list of pills.
    emit(state.copyWith(pills: state.pills, status: PillsStatus.success));
  } else {
    // Filter pills based on the query.
    final filteredPills = state.pills.where((pill) {
      return pill.name.toLowerCase().contains(event.query.toLowerCase());
    }).toList();

    emit(state.copyWith(pills: filteredPills, status: PillsStatus.success));
  }
}
}


