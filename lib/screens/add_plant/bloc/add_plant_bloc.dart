import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydroinator/models/entities/plant_entity.dart';
import 'package:hydroinator/services/db/plant_db.dart';
import 'package:hydroinator/services/db/user_settings_db.dart';
import 'package:hydroinator/services/notification_service.dart';

part 'add_plant_event.dart';
part 'add_plant_state.dart';

class AddPlantBloc extends Bloc<AddPlantEvent, AddPlantState> {
  final PlantDb databaseService;
  final UserSettingsDb userSettingsDb;
  final NotificationService notificationService;
  AddPlantBloc(
      {required this.databaseService,
      required this.notificationService,
      required this.userSettingsDb})
      : super(const AddPlantState()) {
    on<AddPlant>(_onAddPlant);
  }

  void _onAddPlant(AddPlant event, Emitter<AddPlantState> emit) async {
    emit(state.copyWith(plantAddingState: PlantAddingState.adding));
    await databaseService.addPlant(event.plant);
    var dbPlants = await databaseService.getAlivePlants();
    var settings = await userSettingsDb.getSettings();
    var notificationTime = settings?.time;
    await notificationService.scheduleNotifications(dbPlants, notificationTime);
    emit(state.copyWith(plantAddingState: PlantAddingState.added));
  }
}
