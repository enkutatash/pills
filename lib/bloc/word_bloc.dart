import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pills/bloc/WordEvent.dart';
import 'package:pills/bloc/word_state.dart';
import 'package:pills/logic/repository.dart';

class WordBloc extends Bloc<Wordevent , WordState> {
  final Repository repository;

  WordBloc({required this.repository}) : super(const WordState()) {
    on<FetchWordEvent>(_fetchwords);
  }

  FutureOr<void> _fetchwords(FetchWordEvent event , Emitter<WordState>emit) async {
    emit(state.copyWith(status: WordStates.loading));

    try {
        final words = await repository.fetchWords();
        emit(state.copyWith(status: WordStates.success , words: words));
    }catch(e) {
      emit(state.copyWith(status: WordStates.failure));
    }
  }


}