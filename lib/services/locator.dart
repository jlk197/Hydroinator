import 'package:get_it/get_it.dart';
import 'package:hydroinator/screens/home/bloc/home_bloc.dart';
import 'package:hydroinator/services/db/database_service.dart';
import 'package:hydroinator/services/db/plant_db.dart';
import 'package:hydroinator/services/db/user_settings_db.dart';
import 'package:hydroinator/services/notification_service.dart';

final locator = GetIt.instance;
bool locatorInitialized = false;

void setupLocator() {
  locator
      .registerLazySingleton<NotificationService>(() => NotificationService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerLazySingleton<PlantDb>(
      () => PlantDb(locator.get<DatabaseService>()));
  locator.registerLazySingleton<UserSettingsDb>(
      () => UserSettingsDb(locator.get<DatabaseService>()));
  locator.registerLazySingleton<HomeBloc>(() => HomeBloc(
        databaseService: locator.get<PlantDb>(),
        userSettingsDb: locator.get<UserSettingsDb>(),
        notificationService: locator.get<NotificationService>(),
      ));

  locatorInitialized = true;
}
