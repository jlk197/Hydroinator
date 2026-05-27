part of 'add_plant_bloc.dart';

abstract class AddPlantEvent {}

class AddPlant extends AddPlantEvent {
  final Plant plant;
  final File? imageFile;
  final bool isEdit;

  AddPlant(this.plant, this.imageFile, {this.isEdit = false});
}
