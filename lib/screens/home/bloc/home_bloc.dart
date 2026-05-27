import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydroinator/models/image.dart';
import 'package:hydroinator/models/entities/user_settings_entity.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:hydroinator/services/db/user_settings_db.dart';
import 'package:hydroinator/services/firebase/auth_service.dart';
import 'package:hydroinator/services/firebase/firebase_storage_service.dart';
import 'package:hydroinator/services/firebase/firestore_plant_service.dart';
import 'package:hydroinator/services/notification_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirestorePlantService plantService;
  final UserSettingsDb userSettingsDb;
  final NotificationService notificationService;
  final AuthService authService;
  final FirebaseStorageService firebaseStorageService;

  HomeBloc(
      {required this.plantService,
      required this.notificationService,
      required this.userSettingsDb,
      required this.authService, 
      required this.firebaseStorageService})
      : super(const HomeState()) {
    on<InitDataEvent>(_initData);
    on<AddPhotoEvent>(_addPhoto);
    on<AssignAsDeadEvent>(_assignAsDead);
    on<ChangeNotificationsTimeEvent>(_changeNotificationsTime);
    on<LogoutEvent>(_logout);
  }

  Future<void> _initData(
      InitDataEvent event, Emitter<HomeState> emitter) async {
    var settings = await userSettingsDb.getSettings();
    var notificationTime = settings?.time;
    var plants = await _getSortedPlants();
    await notificationService.scheduleNotifications(plants, notificationTime);

    emitter(state.copyWith(
        plants: plants,
        state: HomeLoadingState.loaded,
        notificationTime: notificationTime));
  }

  Future<void> _addPhoto(
      AddPhotoEvent event, Emitter<HomeState> emitter) async {
    emitter(state.copyWith(state: HomeLoadingState.loading));
    var url = await firebaseStorageService.uploadImage(event.photo);
    var updatedPlant =
        state.plants.firstWhere((element) => element.id == event.plantId);
    updatedPlant.imagesFiles = [
      ...updatedPlant.imagesFiles,
      ImageData(image: url, dateTime: DateTime.now())
    ];
    await plantService.updatePlant(updatedPlant);

    var plants = await _getSortedPlants();
    emitter(state.copyWith(plants: plants, state: HomeLoadingState.loaded));
  }

  Future<void> _assignAsDead(
      AssignAsDeadEvent event, Emitter<HomeState> emitter) async {
    emitter(state.copyWith(state: HomeLoadingState.loading));
    var updatedPlant =
        state.plants.firstWhere((element) => element.id == event.plantId);
    updatedPlant.deathDate = DateTime.now();
    updatedPlant.isAlive = false;
    await plantService.updatePlant(updatedPlant);

    var plants = await _getSortedPlants();
    await notificationService.scheduleNotifications(
        plants, state.notificationTime);
    emitter(state.copyWith(plants: plants, state: HomeLoadingState.loaded));
  }

  Future<void> _changeNotificationsTime(
      ChangeNotificationsTimeEvent event, Emitter<HomeState> emitter) async {
    final userSettings = UserSettingsEntity();
    userSettings.time = event.time;
    await userSettingsDb.updateSettings(userSettings);
    emitter(state.copyWith(notificationTime: event.time));

    var dbPlants = await _getSortedPlants();
    await notificationService.scheduleNotifications(dbPlants, event.time);
  }

  Future<void> _logout(LogoutEvent event, Emitter<HomeState> emitter) async {
    emitter(state.copyWith(state: HomeLoadingState.loading));
    await notificationService.cancelAllNotifications();
    await authService.logout();
  }

  Future<List<Plant>> _getSortedPlants() async {
    var plants = await plantService.getAlivePlants();
    plants.sort((a, b) => a.nextWateringDay.compareTo(b.nextWateringDay));
    return plants;
  }
}
