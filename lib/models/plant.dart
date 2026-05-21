import 'package:hydroinator/models/image.dart';

class Plant {
  int id;
  String? documentId;
  String name;
  bool isAlive;

  DateTime addDate;
  DateTime? deathDate;

  int dayInterval;
  DateTime? startDate;

  List<ImageData> imagesFiles;

  Plant({
    required this.id,
    this.documentId,
    required this.name,
    required this.isAlive,
    required this.addDate,
    required this.deathDate,
    required this.dayInterval,
    required this.startDate,
    required this.imagesFiles,
  });

  Plant.empty()
      : id = 0,
        documentId = null,
        name = "",
        isAlive = true,
        addDate = DateTime.now(),
        deathDate = null,
        dayInterval = 0,
        startDate = null,
        imagesFiles = [];

  int get nextWateringDay {
    final start = startDate;
    if (start == null || dayInterval <= 0) return 0;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final startDay = DateTime(start.year, start.month, start.day);

    final daysSinceStart = today.difference(startDay).inDays;
    if (daysSinceStart < 0) return -daysSinceStart;

    final remainder = daysSinceStart % dayInterval;
    return remainder == 0 ? 0 : dayInterval - remainder;
  }

  String get nextWateringString {
    if (nextWateringDay == 0) {
      return "dzisiaj";
    } else if (nextWateringDay == 1) {
      return "jutro";
    } else {
      return "za $nextWateringDay dni";
    }
  }

  String get wateringIntervalString {
    if (dayInterval == 0 || dayInterval == 1) {
      return "codziennie";
    } else {
      return "$dayInterval dni";
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isAlive': isAlive,
      'addDate': addDate.toIso8601String(),
      'deathDate': deathDate?.toIso8601String(),
      'dayInterval': dayInterval,
      'startDate': startDate?.toIso8601String(),
      'imagesFiles': imagesFiles.map((e) => e.toJson()).toList(),
    };
  }

  factory Plant.fromJson(Map<String, dynamic> json) {
  return Plant(
    id: json["id"] as int,
    name: json["name"] as String,
    isAlive: json["isAlive"] as bool,

    addDate: DateTime.parse(json["addDate"] as String),

    deathDate: json["deathDate"] != null
        ? DateTime.parse(json["deathDate"] as String)
        : null,

    dayInterval: json["dayInterval"] as int,

    startDate: json["startDate"] != null
        ? DateTime.parse(json["startDate"] as String)
        : null,

    imagesFiles: (json["imagesFiles"] as List<dynamic>)
        .map((e) => ImageData.fromJson(
              e as Map<String, dynamic>,
            ))
        .toList(),
  );
}
}

