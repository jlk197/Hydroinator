part of 'cemetery_bloc.dart';

enum CemeteryLoadingState { loading, loaded }

class CemeteryState extends Equatable {
  final CemeteryLoadingState state;
  final List<Plant> plants;
  const CemeteryState(
      {this.plants = const [], this.state = CemeteryLoadingState.loading});

  CemeteryState copyWith({CemeteryLoadingState? state, List<Plant>? plants}) {
    return CemeteryState(
      state: state ?? this.state,
      plants: plants ?? this.plants,
    );
  }

  @override
  List<Object> get props => [state, plants];
}
