import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydroinator/models/entities/image_entity.dart';
import 'package:hydroinator/models/entities/plant_entity.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:hydroinator/services/database_service.dart';
import 'package:hydroinator/services/notification_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabaseService databaseService;
  final NotificationService notificationService;

  HomeBloc({required this.databaseService, required this.notificationService})
      : super(const HomeState()) {
    on<InitDataEvent>(_initData);
    on<AddPhotoEvent>(_addPhoto);
    on<AssignAsDeadEvent>(_assignAsDead);
  }

  Future<void> _initData(
      InitDataEvent event, Emitter<HomeState> emitter) async {
    var dbPlants = await databaseService.getAlivePlants();
    List<Plant> plants = dbPlants.map((e) => e.toPlant()).toList();
    emitter(state.copyWith(plants: plants, state: HomeLoadingState.loaded));
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

    await notificationService.scheduleNotifications(dbPlants);
    emitter(state.copyWith(plants: plants, state: HomeLoadingState.loaded));
  }
}
