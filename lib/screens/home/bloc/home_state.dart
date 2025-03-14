part of 'home_bloc.dart';

enum HomeLoadingState { loading, loaded }

class HomeState extends Equatable {
  final HomeLoadingState state;
  final List<Plant> plants;
  final TimeOfDay notificationTime;
  const HomeState(
      {this.plants = const [],
      this.state = HomeLoadingState.loading,
      this.notificationTime = const TimeOfDay(hour: 17, minute: 0)});

  HomeState copyWith(
      {HomeLoadingState? state,
      List<Plant>? plants,
      TimeOfDay? notificationTime}) {
    return HomeState(
        state: state ?? this.state,
        plants: plants ?? this.plants,
        notificationTime: notificationTime ?? this.notificationTime);
  }

  @override
  List<Object> get props => [state, plants, notificationTime];
}
