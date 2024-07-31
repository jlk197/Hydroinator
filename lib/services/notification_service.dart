import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hydroinator/models/entities/plant_entity.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:workmanager/workmanager.dart';

class NotificationService {
  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late final NotificationDetails platformChannelSpecifics;

  Future<void> init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Warsaw'));

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'my_channel_01',
      'Main Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    platformChannelSpecifics =
        const NotificationDetails(android: androidPlatformChannelSpecifics);
  }

  Future<void> scheduleNotifications(List<PlantEntity> plants) async {
    await Workmanager().cancelAll();
    for (var plant in plants) {
      Workmanager().registerPeriodicTask(
        'water_plant_${plant.id}',
        'waterPlantTask',
        initialDelay:
            _calculateInitialDelay(plant.startDate, plant.dayInterval),
        frequency: Duration(days: plant.dayInterval),
        inputData: {
          'plantName': plant.name,
          'interval': plant.dayInterval,
        },
      );
    }
  }

  Future<void> addNotification(PlantEntity plant) async {
    Workmanager().registerPeriodicTask(
      'water_plant_${plant.id}',
      'waterPlantTask',
      initialDelay: _calculateInitialDelay(plant.startDate, plant.dayInterval),
      frequency: Duration(days: plant.dayInterval),
      inputData: {
        'plantName': plant.name,
        'interval': plant.dayInterval,
      },
    );
  }

  Duration _calculateInitialDelay(DateTime? startDate, int dayInterval) {
    DateTime next = startDate!;
    final now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    while (next.isBefore(today)) {
      next = next.add(Duration(days: dayInterval));
    }
    next = next.add(const Duration(hours: 17));
    var x = next.difference(now);
    return x;
  }

  Future<void> showNotification(String plantName) async {
    await flutterLocalNotificationsPlugin.show(
      0,
      'Podlej swoją roślinkę!',
      '$plantName chce pić',
      platformChannelSpecifics,
    );
  }
}
