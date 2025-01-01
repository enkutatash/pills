
import 'package:pills/models/word_entity.dart';

enum WordStates {initial , loading , success , failure}

class WordState {
  final WordStates status;
  final List<WordEntity> words;

  const WordState({
    this.status = WordStates.initial,
    this.words = const [],
    });

    WordState copyWith({
      WordStates? status,
      List<WordEntity>? words,
    }) {
      return WordState(
        status: status ?? this.status,
        words: words ?? this.words,
      );
    }
}