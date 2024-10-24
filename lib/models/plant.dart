import 'package:hydroinator/models/entities/image_entity.dart';
import 'package:hydroinator/models/entities/plant_entity.dart';

class Plant {
  int id;
  String name;
  bool isAlive;

  DateTime addDate;
  DateTime? deathDate;

  int dayInterval;
  DateTime? startDate;

  List<ImageEntity> imagesFiles;

  String dayIntervalString;
  String nextWatering;

  Plant({
    required this.id,
    required this.name,
    required this.isAlive,
    required this.addDate,
    required this.deathDate,
    required this.dayInterval,
    required this.startDate,
    required this.imagesFiles,
    required this.dayIntervalString,
    required this.nextWatering,
  });

  int getNextWatering() {
    if (nextWatering == "dzisiaj") {
      return 0;
    } else if (nextWatering == "jutro") {
      return 1;
    } else {
      return int.tryParse(nextWatering.split(" ")[1]) ?? 0;
    }
  }
}

extension PlantEntityExtension on Plant {
  PlantEntity toPlantEntity() {
    return PlantEntity(
      id: id,
      addDate: addDate,
      dayInterval: dayInterval,
      deathDate: deathDate,
      imagesFiles: imagesFiles,
      isAlive: isAlive,
      name: name,
      startDate: startDate,
    );
  }
}
