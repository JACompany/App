import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';
import 'globalValues.dart' as values;

class Notifications {
  Future showNotification(
      String title, String body, int id, DateTime time) async {
    var androidDetails = AndroidNotificationDetails(
        "Chennel ID", "Notification", "Notification Channel",
        importance: Importance.max,
        priority: Priority.high,
        fullScreenIntent: true);
    var iosDetails = IOSNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    var scheduleTime = TZDateTime.from(time, local);
    await values.notifcation.zonedSchedule(
        id, title, body, scheduleTime, generalNotificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future cancelNotification(int id) async {
    await values.notifcation.cancel(id);
  }
}
