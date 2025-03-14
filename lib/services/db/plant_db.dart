import 'package:hydroinator/models/entities/plant_entity.dart';
import 'package:hydroinator/services/db/database_service.dart';
import 'package:isar/isar.dart';

class PlantDb {
  final DatabaseService _localDb;
  PlantDb(this._localDb);

  Future<List<PlantEntity>> getAlivePlants() async {
    final plants = await _localDb.instance.plantEntitys
        .filter()
        .isAliveEqualTo(true)
        .findAll();
    return plants;
  }

  Future<List<PlantEntity>> getDeadPlants() async {
    final plants = await _localDb.instance.plantEntitys
        .filter()
        .isAliveEqualTo(false)
        .findAll();
    return plants;
  }

  Future<PlantEntity> addPlant(PlantEntity plant) async {
    await _localDb.instance.writeTxn(() async {
      await _localDb.instance.plantEntitys.put(plant);
    });
    return plant;
  }

  Future<void> updatePlant(PlantEntity updatedPlant) async {
    await _localDb.instance.writeTxn(() async {
      final existingPlant = await _localDb.instance.plantEntitys
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

        await _localDb.instance.plantEntitys.put(existingPlant);
      } else {
        throw Exception("Plant with id ${updatedPlant.id} not found");
      }
    });
  }
}
