import 'package:hydroinator/models/entities/plant_entity.dart';
import 'package:hydroinator/models/entities/user_settings_entity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  late final Isar instance;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    instance = await Isar.open(
      [PlantEntitySchema, UserSettingsEntitySchema],
      directory: dir.path,
      inspector: true,
    );
  }
}
