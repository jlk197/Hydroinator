import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydroinator/config/routes.dart';
import 'package:hydroinator/screens/home/home_screen.dart';
import 'package:hydroinator/services/db/database_service.dart';
import 'package:hydroinator/services/locator.dart';
import 'package:hydroinator/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  var notificationService = locator.get<NotificationService>();
  await notificationService.init();

  var database = locator.get<DatabaseService>();
  await database.init();

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
