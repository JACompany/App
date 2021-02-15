import 'dart:async';
import 'dart:ui';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'addTask.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'homepage.dart';
import 'globalValues.dart' as values;
import 'splash_screen.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (values.is_setup == false) setup();
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            home: LoadingScreen(),
          );
        });
      },
    );
  }

  void setup() {
    values.is_setup = true;
    tz.initializeTimeZones();
    //reading tasks
    values.tasks_storage.read(";;;").then((readValues) {
      for (int i = 0; i < readValues.length; i++) {
        if (readValues.elementAt(i).length > 0) {
          List<String> object = readValues.elementAt(i).split(";");
          values.tasks.add(Task_Details(object[0], DateTime.parse(object[1]),
              DateTime.parse(object[2]), int.parse(object[3])));
        }
      }
    });
    //reading completed tasks
    values.completed_tasks_storage.read(";;;").then((readValues) {
      for (int i = 0; i < readValues.length; i++) {
        if (readValues.elementAt(i).length > 0) {
          values.completed_tasks
              .add(readValues[0] + ";" + readValues[1] + ";;;");
        }
      }
    });
    //starting notifications
    var androidInit = AndroidInitializationSettings("improvall_logo");
    var iosInit = IOSInitializationSettings();
    var initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);
    values.notifcation = FlutterLocalNotificationsPlugin();
    values.notifcation.initialize(initSettings, onSelectNotification: null);
    //reading all other values
    values.values_storage.read(";").then((readValues) {
      if (readValues == null) {
        print("---------------it is null -----------");
        values.total_hours = 0;
        values.user_goal = 0;
        values.user_hours_day = 0;
        values.past_hours = [0];
        values.userID = "";
        values.is_intial_setup = false;
        values.notificationID = 0;
      } else {
        print("-------------------it is not null-----------");
        print(readValues.toString());
        values.total_hours = double.tryParse(readValues[0]);
        if (values.total_hours == null) values.total_hours = 0;
        values.user_goal = double.tryParse(readValues[1]);
        if (values.user_goal == null) values.user_goal = 0;
        values.user_hours_day = double.tryParse(readValues[2]);
        if (values.user_hours_day == null) values.user_hours_day = 0;
        List val = readValues[3].split(",");
        for (String a in val) {
          values.past_hours.add(double.tryParse(a));
        }
        values.userID = readValues[4];
        values.notificationID = int.tryParse(readValues[5]);
        if (values.notificationID == null) values.notificationID = 0;
        values.is_intial_setup = readValues[6] == 'true';
      }
    });
  }
}
