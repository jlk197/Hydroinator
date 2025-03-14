import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'user_settings_entity.g.dart';

@Collection()
class UserSettingsEntity {
  Id? id = Isar.autoIncrement;
  String? notificationsTime;
  UserSettingsEntity({this.notificationsTime});

  @ignore
  TimeOfDay get time {
    var time = notificationsTime;
    if (time != null) {
      var splited = time.split(":");
      if (splited.length == 2) {
        final hours = splited[0];
        final minutes = splited[1];
        return TimeOfDay(hour: int.parse(hours), minute: int.parse(minutes));
      }
    }
    return const TimeOfDay(hour: 17, minute: 0);
  }

  set time(TimeOfDay value) {
    notificationsTime =
        "${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}";
  }
}
