import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydroinator/auth_gate.dart';
import 'package:hydroinator/config/routes.dart';
import 'package:hydroinator/screens/home/bloc/home_bloc.dart';
import 'package:hydroinator/screens/login/bloc/login_bloc.dart';
import 'package:hydroinator/services/db/database_service.dart';
import 'package:hydroinator/services/firebase/auth_service.dart';
import 'package:hydroinator/services/locator.dart';
import 'package:hydroinator/services/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            authService: locator.get<AuthService>(),
          ),
        ),
        BlocProvider.value(
          value: locator.get<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
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
        home: const AuthGate(),
        routes: routes,
      ),
    );
  }
}
