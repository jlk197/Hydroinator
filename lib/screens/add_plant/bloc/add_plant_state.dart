part of 'add_plant_bloc.dart';

enum PlantAddingState { idle, adding, added }

class AddPlantState extends Equatable {
  final PlantAddingState plantAddingState;

  const AddPlantState({this.plantAddingState = PlantAddingState.idle});

  AddPlantState copyWith({PlantAddingState? plantAddingState}) {
    return AddPlantState(
      plantAddingState: plantAddingState ?? this.plantAddingState,
    );
  }

  @override
  List<Object> get props => [plantAddingState];
}
