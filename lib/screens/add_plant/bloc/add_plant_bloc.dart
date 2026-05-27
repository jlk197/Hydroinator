import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydroinator/models/image.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:hydroinator/services/db/user_settings_db.dart';
import 'package:hydroinator/services/firebase/firebase_storage_service.dart';
import 'package:hydroinator/services/firebase/firestore_plant_service.dart';
import 'package:hydroinator/services/notification_service.dart';

part 'add_plant_event.dart';
part 'add_plant_state.dart';

class AddPlantBloc extends Bloc<AddPlantEvent, AddPlantState> {
  final FirestorePlantService databaseService;
  final UserSettingsDb userSettingsDb;
  final NotificationService notificationService;
  final FirebaseStorageService storageService;
  AddPlantBloc(
      {required this.databaseService,
      required this.notificationService,
      required this.userSettingsDb,
      required this.storageService})
      : super(const AddPlantState()) {
    on<AddPlant>(_onAddPlant);
  }

  void _onAddPlant(AddPlant event, Emitter<AddPlantState> emit) async {
    emit(state.copyWith(plantAddingState: PlantAddingState.adding));
    var plant = event.plant;
    var file = event.imageFile;
    if(file != null) {
      var url = await storageService.uploadImage(file);
      plant.imagesFiles = [ImageData(image: url, dateTime: DateTime.now())];
    }

    if (event.isEdit) {
      await databaseService.updatePlant(plant);
    } else {
      await databaseService.addPlant(plant);
    }
    var dbPlants = await databaseService.getAlivePlants();
    var settings = await userSettingsDb.getSettings();
    var notificationTime = settings?.time;
    await notificationService.scheduleNotifications(dbPlants, notificationTime);
    emit(state.copyWith(plantAddingState: PlantAddingState.added));
  }
}
