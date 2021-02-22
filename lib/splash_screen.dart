import 'SetupPage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'main.dart';
import 'homepage.dart';
import 'globalValues.dart' as values;
import 'dart:async';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
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

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreen createState() => new _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterFuture: initializeAllValues(),
      image: Image(
        image: AssetImage("lib/assets/improvall_logo.png"),
      ),
      backgroundColor: Colors.white,
      useLoader: true,
      loaderColor: Colors.black,
      photoSize: MediaQuery.of(context).size.width / 2 - 50,
    );
  }

  Future<Widget> initializeAllValues() async {
    values.is_setup = true;
    tz.initializeTimeZones();
    //reading tasks
    await values.tasks_storage.read(";;;").then((readValues) {
      if (readValues == null)
        values.tasks = [];
      else
        for (int i = 0; i < readValues.length; i++) {
          if (readValues.elementAt(i).length > 0) {
            List<String> object = readValues.elementAt(i).split(";");
            values.tasks.add(Task_Details(object[0], DateTime.parse(object[1]),
                DateTime.parse(object[2]), int.parse(object[3])));
          }
        }
    });
    //reading completed tasks
    await values.completed_tasks_storage.read(";;;").then((readValues) {
      if (readValues == null)
        values.completed_tasks = [];
      else
        for (int i = 0; i < readValues.length; i++) {
          if (readValues.elementAt(i).length > 0) {
            values.completed_tasks.add(readValues.elementAt(i) + ";;;");
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
    await values.values_storage.read(";").then((readValues) {
      if (readValues == null) {
        values.total_hours = 0;
        values.user_goal = 0;
        values.user_hours_day = 0;
        values.userID = "";
        values.is_intial_setup = false;
        values.notificationID = 0;
      } else {
        values.total_hours = double.tryParse(readValues[0]);
        if (values.total_hours == null) values.total_hours = 0;
        values.user_goal = double.tryParse(readValues[1]);
        if (values.user_goal == null) values.user_goal = 0;
        values.user_hours_day = double.tryParse(readValues[2]);
        if (values.user_hours_day == null) values.user_hours_day = 0;
        values.userID = readValues[3];
        values.notificationID = int.tryParse(readValues[4]);
        if (values.notificationID == null) values.notificationID = 0;
        values.is_intial_setup = readValues[5] == 'true';
      }
    });
    await values.past_hours_storage.read(",").then((readValues) {
      if (readValues != null) {
        for (int i = 0; i < readValues.length; i++) {
          values.past_hours.add(double.tryParse(readValues.elementAt(i)));
        }
      } else {
        values.past_hours = [];
      }
    });
    values.values_storage.write_all_values();
    if (values.is_intial_setup) {
      return Home();
    }
    return SetupPage();
  }
}
//values.is_intial_setup ? Home() : SetupPage()