part of 'pills_bloc.dart';

abstract class PillsEvent extends Equatable {
  const PillsEvent();

  @override
  List<Object?> get props => [];
}

class FetchPillsEvent extends PillsEvent {
  final String category;

  const FetchPillsEvent({required this.category});

  @override
  List<Object?> get props => [category];
}

class SearchPillsEvent extends PillsEvent {
  final String query;

  const SearchPillsEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
