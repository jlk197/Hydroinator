import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:hydroinator/services/firebase/firestore_plant_service.dart';

part 'cemetery_event.dart';
part 'cemetery_state.dart';

class CemeteryBloc extends Bloc<CemeteryEvent, CemeteryState> {
  final FirestorePlantService databaseService;
  CemeteryBloc({required this.databaseService}) : super(const CemeteryState()) {
    on<LoadCemeteryEvent>(_onLoad);
  }
  Future<void> _onLoad(
      LoadCemeteryEvent event, Emitter<CemeteryState> emitter) async {
    var plants = await databaseService.getDeadPlants();
    emitter(state.copyWith(plants: plants, state: CemeteryLoadingState.loaded));
  }
}
