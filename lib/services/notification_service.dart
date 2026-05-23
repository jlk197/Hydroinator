import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hydroinator/models/plant.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static const int _maxNotificationsPerPlant = 20;
  static const int _maxTotalNotifications = 400;
  static const int _maxScheduleHorizonDays = 365;

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

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> scheduleNotifications(
      List<Plant> plants, TimeOfDay? time) async {
    time ??= const TimeOfDay(hour: 17, minute: 0);
    await flutterLocalNotificationsPlugin.cancelAll();
    int scheduled = 0;
    for (var i = 0; i < plants.length; i++) {
      final plant = plants[i];
      if (!plant.isAlive) continue;
      final remaining = _maxTotalNotifications - scheduled;
      if (remaining <= 0) break;
      scheduled += await planNotifications(
          i, plant.name, plant.startDate, plant.dayInterval, time, remaining);
    }
  }

  Future<int> planNotifications(int plantIndex, String plantName,
      DateTime? startDate, int dayInterval, TimeOfDay time, int budget) async {
    if (startDate == null || dayInterval <= 0 || budget <= 0) return 0;
    final DateTime initial =
        _calculateInitialDate(startDate, dayInterval, time);
    final int baseId = plantIndex * 1000;

    if (dayInterval == 1) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        baseId,
        'Podlej swoją roślinkę!',
        '$plantName chce pić',
        tz.TZDateTime.from(initial, tz.local),
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      return 1;
    }
    if (dayInterval == 7) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        baseId,
        'Podlej swoją roślinkę!',
        '$plantName chce pić',
        tz.TZDateTime.from(initial, tz.local),
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
      return 1;
    }

    final int perPlantCap = budget < _maxNotificationsPerPlant
        ? budget
        : _maxNotificationsPerPlant;
    final DateTime horizon =
        DateTime.now().add(const Duration(days: _maxScheduleHorizonDays));
    DateTime date = initial;
    int count = 0;
    while (count < perPlantCap && date.isBefore(horizon)) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          baseId + count,
          'Podlej swoją roślinkę!',
          '$plantName chce pić',
          tz.TZDateTime.from(date, tz.local),
          platformChannelSpecifics,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.wallClockTime);
      date = date.add(Duration(days: dayInterval));
      count++;
    }
    return count;
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
