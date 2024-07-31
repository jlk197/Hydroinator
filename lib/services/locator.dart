import 'package:get_it/get_it.dart';
import 'package:hydroinator/screens/home/bloc/home_bloc.dart';
import 'package:hydroinator/services/database_service.dart';
import 'package:hydroinator/services/notification_service.dart';

final locator = GetIt.instance;
bool locatorInitialized = false;

void setupLocator() {
  locator
      .registerLazySingleton<NotificationService>(() => NotificationService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerLazySingleton<HomeBloc>(() => HomeBloc(
        databaseService: locator.get<DatabaseService>(),
      ));

  locatorInitialized = true;
}
