import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydroinator/models/entities/plant_entity.dart';
import 'package:hydroinator/services/database_service.dart';
import 'package:hydroinator/services/notification_service.dart';

part 'add_plant_event.dart';
part 'add_plant_state.dart';

class AddPlantBloc extends Bloc<AddPlantEvent, AddPlantState> {
  final DatabaseService databaseService;
  final NotificationService notificationService;
  AddPlantBloc(
      {required this.databaseService, required this.notificationService})
      : super(const AddPlantState()) {
    on<AddPlant>(_onAddPlant);
  }

  void _onAddPlant(AddPlant event, Emitter<AddPlantState> emit) async {
    emit(state.copyWith(plantAddingState: PlantAddingState.adding));
    await databaseService.addPlant(event.plant);
    var dbPlants = await databaseService.getAlivePlants();
    await notificationService.scheduleNotifications(dbPlants);
    emit(state.copyWith(plantAddingState: PlantAddingState.added));
  }
}
