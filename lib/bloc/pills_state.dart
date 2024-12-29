part of 'pills_bloc.dart';

enum PillsStatus { initial, loading, success, failure }

class PillsState extends Equatable {
  final PillsStatus status;
  final List<PillsModel> pills;
  final String failure;

  const PillsState({
    this.status = PillsStatus.initial,
    this.pills = const [],
    this.failure = '',
  });

  PillsState copyWith({
    PillsStatus? status,
    List<PillsModel>? pills,
    String? failure,
  }) {
    return PillsState(
      status: status ?? this.status,
      pills: pills ?? this.pills,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, pills, failure];
}



