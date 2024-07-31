import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydroinator/screens/add_plant/add_plant_screen.dart';
import 'package:hydroinator/screens/add_plant/bloc/add_plant_bloc.dart';
import 'package:hydroinator/screens/cemetery/bloc/cemetery_bloc.dart';
import 'package:hydroinator/screens/cemetery/cemetery_screen.dart';
import 'package:hydroinator/screens/home/bloc/home_bloc.dart';
import 'package:hydroinator/screens/home/home_screen.dart';
import 'package:hydroinator/services/database_service.dart';
import 'package:hydroinator/services/locator.dart';
import 'package:hydroinator/services/notification_service.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomeScreen.route: (ctx) => BlocProvider.value(
        value: locator.get<HomeBloc>()..add(InitDataEvent()),
        child: const HomeScreen(),
      ),
  AddPlantScreen.route: (ctx) => BlocProvider(
        create: (context) => AddPlantBloc(
          databaseService: locator.get<DatabaseService>(),
          notificationService: locator.get<NotificationService>(),
        ),
        child: const AddPlantScreen(),
      ),
  CemeteryScreen.route: (ctx) => BlocProvider(
        create: (context) => CemeteryBloc(
          databaseService: locator.get<DatabaseService>(),
        )..add(LoadCemeteryEvent()),
        child: const CemeteryScreen(),
      ),
};
