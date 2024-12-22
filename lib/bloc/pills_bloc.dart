import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/logic/repository.dart';
import 'package:pills/models/pills_model.dart';
import 'package:pills/models/word_entity.dart';

part 'pills_event.dart';
part 'pills_state.dart';

class PillsBloc extends Bloc<PillsEvent, PillsState> {
  final Repository repository;
  PillsBloc({required this.repository}) : super(PillsState()) {
    on<FetchPillsEvent>(_onFetchAntibiotics);
    on<FetchWordsEvent>(_onFetchWords);
  }
FutureOr<void> _onFetchAntibiotics(
    FetchPillsEvent event, Emitter<PillsState> emit) async {
 
  emit(state.copyWith(status: PillsStatus.loading));

  try {
    
    final pills = await repository.fetchPills(event.category);
    
    emit(state.copyWith(pills: pills, status: PillsStatus.success));
  } catch (e) {
    
    emit(state.copyWith(status: PillsStatus.failure, failure: e.toString()));
  }
}



  FutureOr<void> _onFetchWords(FetchWordsEvent event, Emitter<PillsState> emit) async{
     emit(state.copyWith(status: PillsStatus.loading));

  try {
    
    final words = await repository.fetchWords();
    
    emit(state.copyWith(words: words, status: PillsStatus.wordsFetched));
  } catch (e) {
    
    emit(state.copyWith(status: PillsStatus.wordsFetchFailed, failure: e.toString()));
  }

  }
}
