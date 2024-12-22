part of 'pills_bloc.dart';

class PillsEvent extends Equatable {
  const PillsEvent();

  @override
  List<Object> get props => [];
}

class FetchPillsEvent extends PillsEvent {
  final String category;

  const FetchPillsEvent({required this.category});
}


class FetchWordsEvent extends PillsEvent {
  

  const FetchWordsEvent();
}