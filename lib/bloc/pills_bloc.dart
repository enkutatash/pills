import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/logic/repository.dart';
import 'package:pills/models/pills_model.dart';

part 'pills_event.dart';
part 'pills_state.dart';

class PillsBloc extends Bloc<PillsEvent, PillsState> {
  final Repository repository;

  PillsBloc({required this.repository}) : super(const PillsState()) {
    on<FetchPillsEvent>(_onFetchPills);
    on<SearchPillsEvent>(_onSearchPills); 
  }


  FutureOr<void> _onFetchPills(FetchPillsEvent event, Emitter<PillsState> emit) async {
    emit(state.copyWith(status: PillsStatus.loading));

    try {
      final pills = await repository.fetchPills(event.category);
      emit(state.copyWith(pills: pills, status: PillsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: PillsStatus.failure, failure: e.toString()));
    }
  }


FutureOr<void> _onSearchPills(SearchPillsEvent event, Emitter<PillsState> emit) async {
  if (event.query.isEmpty) {

    emit(state.copyWith(pills: state.pills, status: PillsStatus.success));
  } else {
    final filteredPills = state.pills.where((pill) {
      return pill.name.toLowerCase().contains(event.query.toLowerCase());
    }).toList();

    emit(state.copyWith(pills: filteredPills, status: PillsStatus.success));
  }
}}


