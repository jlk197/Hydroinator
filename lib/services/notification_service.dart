import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hydroinator/models/entities/plant_entity.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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

  Future<void> scheduleNotifications(
      List<PlantEntity> plants, TimeOfDay? time) async {
    time ??= const TimeOfDay(hour: 17, minute: 0);
    await flutterLocalNotificationsPlugin.cancelAll();
    for (var plant in plants) {
      if (plant.isAlive) {
        planNotifications(plants.indexOf(plant), plant.name, plant.startDate,
            plant.dayInterval, time);
      }
    }
  }

  Future<void> planNotifications(int plantIndex, String plantName,
      DateTime? startDate, int dayInterval, TimeOfDay time) async {
    if (startDate == null) return;
    DateTime date = _calculateInitialDate(startDate, dayInterval, time);
    int index = plantIndex * 1000;
    while (date.isBefore(DateTime.now().add(const Duration(days: 365)))) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          index,
          'Podlej swoją roślinkę!',
          '$plantName chce pić',
          tz.TZDateTime.from(date, tz.local),
          platformChannelSpecifics,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.wallClockTime);
      date = date.add(Duration(days: dayInterval));
      index++;
    }
  }

  DateTime _calculateInitialDate(
      DateTime? startDate, int dayInterval, TimeOfDay time) {
    DateTime next =
        startDate!.add(Duration(hours: time.hour, minutes: time.minute));
    final now = DateTime.now();
    while (next.isBefore(now)) {
      next = next.add(Duration(days: dayInterval));
    }
    return next;
  }
}
