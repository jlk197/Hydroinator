import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydroinator/config/routes.dart';
import 'package:hydroinator/screens/home/home_screen.dart';
import 'package:hydroinator/services/database_service.dart';
import 'package:hydroinator/services/locator.dart';
import 'package:hydroinator/services/notification_service.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (locatorInitialized == false) {
      setupLocator();
      var notificationService = locator.get<NotificationService>();
      await notificationService.init();
    }
    var notificationService = locator.get<NotificationService>();

    final plantName = inputData?['plantName'] ?? 'Twoja roślinka';
    await notificationService.showNotification(plantName);
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  var notificationService = locator.get<NotificationService>();
  await notificationService.init();

  var database = locator.get<DatabaseService>();
  await database.init();

  Workmanager().initialize(callbackDispatcher, isInDebugMode: false);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pl'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routes,
      initialRoute: HomeScreen.route,
    );
  }
}
