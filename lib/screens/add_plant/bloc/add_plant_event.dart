part of 'add_plant_bloc.dart';

abstract class AddPlantEvent {}

class AddPlant extends AddPlantEvent {
  final PlantEntity plant;

  AddPlant(this.plant);
}
