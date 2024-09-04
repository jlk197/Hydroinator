import 'package:hydroinator/models/entities/image_entity.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:isar/isar.dart';

part 'plant_entity.g.dart';

@Collection()
class PlantEntity {
  Id? id = Isar.autoIncrement;

  String name = "";
  bool isAlive = true;

  DateTime addDate = DateTime.now();
  DateTime? deathDate;

  int dayInterval = 1;
  DateTime? startDate = DateTime.now();

  List<ImageEntity> imagesFiles = [];

  PlantEntity(
      {required this.addDate,
      required this.dayInterval,
      this.deathDate,
      this.id,
      required this.imagesFiles,
      required this.isAlive,
      required this.name,
      this.startDate});
  factory PlantEntity.empty() {
    return PlantEntity(
      addDate: DateTime.now(),
      dayInterval: 1,
      imagesFiles: [],
      isAlive: true,
      name: "",
    );
  }
}

extension PlantEntityExtension on PlantEntity {
  String get nextWatering {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    if (isAlive && startDate != null) {
      DateTime next = startDate!;
      while (next.isBefore(today)) {
        next = next.add(Duration(days: dayInterval));
      }
      var difference = next.difference(today).inDays;
      if (difference == 0) {
        return "dzisiaj";
      } else if (difference == 1) {
        return "jutro";
      } else {
        return "za $difference dni";
      }
    } else {
      return "";
    }
  }

  String get dayIntervalString {
    if (dayInterval == 1) {
      return "1 dzień";
    } else {
      return "$dayInterval dni";
    }
  }

  Plant toPlant() {
    return Plant(
      id: id ?? -1,
      addDate: addDate,
      dayInterval: dayInterval,
      dayIntervalString: dayIntervalString,
      deathDate: deathDate,
      imagesFiles: imagesFiles,
      isAlive: isAlive,
      name: name,
      nextWatering: nextWatering,
      startDate: startDate,
    );
  }
}
