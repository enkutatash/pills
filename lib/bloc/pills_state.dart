part of 'pills_bloc.dart';

enum PillsStatus { initial, loading, success, failure ,wordsFetched, wordsFetchFailed}
class PillsState extends Equatable {
  final List<PillsModel> pills;
  final PillsStatus status;
  final List<WordEntity> words;
  final String? failure;
  const PillsState({
    this.pills = const <PillsModel>[],
    this.status = PillsStatus.initial,
    this.words = const <WordEntity>[],
    this.failure,
  });

  PillsState copyWith({
    List<PillsModel>? pills,
    PillsStatus? status,
    List<WordEntity>? words,
    String? failure,
  }) {
    print("copyWith called");
    return PillsState(
      pills: pills ?? this.pills,
      status: status ?? this.status,
      words: words ?? this.words,
      failure: failure ?? this.failure,
    );
  }
  
  @override
  List<Object> get props => [pills, status, failure ?? '', words];
}


