import 'package:hydroinator/models/entities/plant_entity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  late final Isar _instance;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _instance = await Isar.open(
      [PlantEntitySchema],
      directory: dir.path,
      inspector: true,
    );
  }

  Future<List<PlantEntity>> getAlivePlants() async {
    final plants =
        await _instance.plantEntitys.filter().isAliveEqualTo(true).findAll();
    return plants;
  }

  Future<List<PlantEntity>> getDeadPlants() async {
    final plants =
        await _instance.plantEntitys.filter().isAliveEqualTo(false).findAll();
    return plants;
  }

  Future<PlantEntity> addPlant(PlantEntity plant) async {
    await _instance.writeTxn(() async {
      await _instance.plantEntitys.put(plant);
    });
    return plant;
  }

  Future<void> updatePlant(PlantEntity updatedPlant) async {
    await _instance.writeTxn(() async {
      final existingPlant = await _instance.plantEntitys
          .where()
          .filter()
          .idEqualTo(updatedPlant.id)
          .findFirst();

      if (existingPlant != null) {
        existingPlant.name = updatedPlant.name;
        existingPlant.isAlive = updatedPlant.isAlive;
        existingPlant.deathDate = updatedPlant.deathDate;
        existingPlant.dayInterval = updatedPlant.dayInterval;
        existingPlant.startDate = updatedPlant.startDate;

        existingPlant.imagesFiles = updatedPlant.imagesFiles;

        await _instance.plantEntitys.put(existingPlant);
      } else {
        throw Exception("Plant with id ${updatedPlant.id} not found");
      }
    });
  }
}
