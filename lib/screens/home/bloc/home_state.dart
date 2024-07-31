part of 'home_bloc.dart';

enum HomeLoadingState { loading, loaded }

class HomeState extends Equatable {
  final HomeLoadingState state;
  final List<Plant> plants;
  const HomeState(
      {this.plants = const [], this.state = HomeLoadingState.loading});

  HomeState copyWith({HomeLoadingState? state, List<Plant>? plants}) {
    return HomeState(
      state: state ?? this.state,
      plants: plants ?? this.plants,
    );
  }

  @override
  List<Object> get props => [state, plants];
}
