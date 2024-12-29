// part of 'pills_bloc.dart';

// enum PillsStatus { initial, loading, success, failure }
// class PillsState extends Equatable {
//   final List<PillsModel> pills;
//   final PillsStatus status;
//   final String? failure;
//   const PillsState({
//     this.pills = const <PillsModel>[],
//     this.status = PillsStatus.initial,
//     this.failure,
//   });

//   PillsState copyWith({
//     List<PillsModel>? pills,
//     PillsStatus? status,
//     String? failure,
//   }) {
//     print("copyWith called");
//     return PillsState(
//       pills: pills ?? this.pills,
//       status: status ?? this.status,
//       failure: failure ?? this.failure,
//     );
//   }
  
//   @override
//   List<Object> get props => [pills, status, failure ?? ''];
// }

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



