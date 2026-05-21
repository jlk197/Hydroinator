part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitDataEvent extends HomeEvent {}

class AddPhotoEvent extends HomeEvent {
  final File photo;
  final int plantId;
  const AddPhotoEvent(this.photo, this.plantId);
}

class AssignAsDeadEvent extends HomeEvent {
  final int plantId;
  const AssignAsDeadEvent(this.plantId);
}

class ChangeNotificationsTimeEvent extends HomeEvent {
  final TimeOfDay time;
  const ChangeNotificationsTimeEvent(this.time);
}

class LogoutEvent extends HomeEvent {}
