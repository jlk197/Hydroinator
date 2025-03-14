import 'package:hydroinator/models/entities/user_settings_entity.dart';
import 'package:hydroinator/services/db/database_service.dart';
import 'package:isar/isar.dart';

class UserSettingsDb {
  final DatabaseService _localDb;
  UserSettingsDb(this._localDb);

  Future<UserSettingsEntity?> getSettings() async {
    final settings =
        await _localDb.instance.userSettingsEntitys.where().findFirst();
    return settings;
  }

  Future<void> updateSettings(UserSettingsEntity updatedSettings) async {
    await _localDb.instance.writeTxn(() async {
      updatedSettings.id = 1;
      await _localDb.instance.userSettingsEntitys.put(updatedSettings);
    });
  }
}
