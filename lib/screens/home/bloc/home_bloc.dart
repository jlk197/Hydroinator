import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydroinator/models/entities/image_entity.dart';
import 'package:hydroinator/models/entities/plant_entity.dart';
import 'package:hydroinator/models/entities/user_settings_entity.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:hydroinator/services/db/plant_db.dart';
import 'package:hydroinator/services/db/user_settings_db.dart';
import 'package:hydroinator/services/notification_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PlantDb databaseService;
  final UserSettingsDb userSettingsDb;
  final NotificationService notificationService;

  HomeBloc(
      {required this.databaseService,
      required this.notificationService,
      required this.userSettingsDb})
      : super(const HomeState()) {
    on<InitDataEvent>(_initData);
    on<AddPhotoEvent>(_addPhoto);
    on<AssignAsDeadEvent>(_assignAsDead);
    on<ChangeNotificationsTimeEvent>(_changeNotificationsTime);
  }

  Future<void> _initData(
      InitDataEvent event, Emitter<HomeState> emitter) async {
    var settings = await userSettingsDb.getSettings();
    var notificationTime = settings?.time;
    var dbPlants = await databaseService.getAlivePlants();
    await notificationService.scheduleNotifications(dbPlants, notificationTime);
    List<Plant> plants = dbPlants.map((e) => e.toPlant()).toList();
    plants.sort((a, b) => a.getNextWatering().compareTo(b.getNextWatering()));

    emitter(state.copyWith(
        plants: plants,
        state: HomeLoadingState.loaded,
        notificationTime: notificationTime));
  }

  Future<void> _addPhoto(
      AddPhotoEvent event, Emitter<HomeState> emitter) async {
    emitter(state.copyWith(state: HomeLoadingState.loading));
    var updatedPlant =
        state.plants.firstWhere((element) => element.id == event.plantId);
    updatedPlant.imagesFiles = [
      ...updatedPlant.imagesFiles,
      ImageEntity(image: event.photo, dateTime: DateTime.now())
    ];
    await databaseService.updatePlant(updatedPlant.toPlantEntity());

    var dbPlants = await databaseService.getAlivePlants();
    List<Plant> plants = dbPlants.map((e) => e.toPlant()).toList();
    plants.sort((a, b) {
      var firstWatering = int.tryParse(a.nextWatering.split(" ")[1]) ?? 0;
      var secondWatering = int.tryParse(b.nextWatering.split(" ")[1]) ?? 0;
      return firstWatering.compareTo(secondWatering);
    });
    emitter(state.copyWith(plants: plants, state: HomeLoadingState.loaded));
  }

  Future<void> _assignAsDead(
      AssignAsDeadEvent event, Emitter<HomeState> emitter) async {
    emitter(state.copyWith(state: HomeLoadingState.loading));
    var updatedPlant =
        state.plants.firstWhere((element) => element.id == event.plantId);
    updatedPlant.deathDate = DateTime.now();
    updatedPlant.isAlive = false;
    await databaseService.updatePlant(updatedPlant.toPlantEntity());

    var dbPlants = await databaseService.getAlivePlants();
    List<Plant> plants = dbPlants.map((e) => e.toPlant()).toList();
    plants.sort((a, b) {
      var firstWatering = int.tryParse(a.nextWatering.split(" ")[1]) ?? 0;
      var secondWatering = int.tryParse(b.nextWatering.split(" ")[1]) ?? 0;
      return firstWatering.compareTo(secondWatering);
    });
    await notificationService.scheduleNotifications(
        dbPlants, state.notificationTime);
    emitter(state.copyWith(plants: plants, state: HomeLoadingState.loaded));
  }

  Future<void> _changeNotificationsTime(
      ChangeNotificationsTimeEvent event, Emitter<HomeState> emitter) async {
    final userSettings = UserSettingsEntity();
    userSettings.time = event.time;
    await userSettingsDb.updateSettings(userSettings);
    emitter(state.copyWith(notificationTime: event.time));

    var dbPlants = await databaseService.getAlivePlants();
    await notificationService.scheduleNotifications(dbPlants, event.time);
  }
}
