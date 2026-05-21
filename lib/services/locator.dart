import 'package:get_it/get_it.dart';
import 'package:hydroinator/screens/home/bloc/home_bloc.dart';
import 'package:hydroinator/services/db/database_service.dart';
import 'package:hydroinator/services/db/user_settings_db.dart';
import 'package:hydroinator/services/firebase/auth_service.dart';
import 'package:hydroinator/services/firebase/firebase_storage_service.dart';
import 'package:hydroinator/services/firebase/firestore_plant_service.dart';
import 'package:hydroinator/services/notification_service.dart';

final locator = GetIt.instance;
bool locatorInitialized = false;

void setupLocator() {
  locator.registerLazySingleton<AuthService>(
      () => AuthService());
      locator.registerLazySingleton<FirebaseStorageService>(
      () => FirebaseStorageService());
  locator.registerLazySingleton<FirestorePlantService>(
      () => FirestorePlantService(authService: locator.get<AuthService>()));
  locator
      .registerLazySingleton<NotificationService>(() => NotificationService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerLazySingleton<UserSettingsDb>(
      () => UserSettingsDb(locator.get<DatabaseService>()));
  locator.registerLazySingleton<HomeBloc>(() => HomeBloc(
        plantService: locator.get<FirestorePlantService>(),
        userSettingsDb: locator.get<UserSettingsDb>(),
        notificationService: locator.get<NotificationService>(),
        authService: locator.get<AuthService>(),
        firebaseStorageService: locator.get<FirebaseStorageService>(),
      ));

      
  locatorInitialized = true;
}
