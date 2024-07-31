import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydroinator/models/entities/plant_entity.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:hydroinator/services/database_service.dart';

part 'cemetery_event.dart';
part 'cemetery_state.dart';

class CemeteryBloc extends Bloc<CemeteryEvent, CemeteryState> {
  final DatabaseService databaseService;
  CemeteryBloc({required this.databaseService}) : super(const CemeteryState()) {
    on<LoadCemeteryEvent>(_onLoad);
  }
  Future<void> _onLoad(
      LoadCemeteryEvent event, Emitter<CemeteryState> emitter) async {
    var dbPlants = await databaseService.getDeadPlants();
    List<Plant> plants = dbPlants.map((e) => e.toPlant()).toList();
    emitter(state.copyWith(plants: plants, state: CemeteryLoadingState.loaded));
  }
}
