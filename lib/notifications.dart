import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'addTask.dart';
import 'calendar.dart';
import 'globalValues.dart' as values;
import 'package:sizer/sizer.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'leaderboard.dart';
import 'profile.dart';
import 'progress_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            home: Notifications(),
          );
        });
      },
    );
  }
}

//https://www.youtube.com/watch?v=U38FJ40cEAE&ab_channel=DesiProgrammer
class Notifications extends StatefulWidget {
  @override
  _Notifications createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    var androidInit = AndroidInitializationSettings("improvall_logo");
    var iosInit = IOSInitializationSettings();
    var initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);
    notification = FlutterLocalNotificationsPlugin();
    notification.initialize(initSettings, onSelectNotification: onSelect);

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  Future showNotification() async {
    var androidDetails = AndroidNotificationDetails(
        "Chennel ID", "JA", "This is a notification",
        importance: Importance.max,
        priority: Priority.high,
        fullScreenIntent: true);
    var iosDetails = IOSNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    var scheduleTime = tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));
    await notification.zonedSchedule(1, "Scheduled Task", "Do stuff",
        scheduleTime, generalNotificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future onSelect(String payload) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Notification Clicked"),
            ));
  }

  FlutterLocalNotificationsPlugin notification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: values.color_green, title: Text("Notification")),
      body: Column(
        children: [
          RaisedButton(
            onPressed: showNotification,
            child: Text("Start Notification"),
          ),
          RaisedButton(
            onPressed: cancelNotification,
            child: Text("Cancel Notification"),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 8.0.h,
      //   alignment: Alignment.bottomCenter,
      //   color: values.color_green,
      //   child: Row(
      //     children: [
      //       Expanded(
      //           child: IconButton(
      //         icon: Icon(
      //           Icons.timer,
      //           color:
      //               values.current_page == "home" ? Colors.white : Colors.black,
      //         ),
      //         onPressed: onPressed1,
      //         iconSize: 6.0.h,
      //       )),
      //       Expanded(
      //           child: IconButton(
      //         icon: Icon(Icons.insights),
      //         onPressed: onPressed2,
      //         iconSize: 6.0.h,
      //       )),
      //       // Expanded(
      //       //     child: IconButton(
      //       //   icon: Icon(Icons.leaderboard),
      //       //   onPressed: onPressed3,
      //       //   iconSize: 6.0.h,
      //       // )),
      //       // Expanded(
      //       //     child: IconButton(
      //       //   icon: Icon(Icons.account_circle),
      //       //   onPressed: onPressed4,
      //       //   iconSize: 6.0.h,
      //       // ))
      //     ],
      //   ),
      // ),
    );
  }

  void cancelNotification() {
    notification.cancel(1);
  }

  void onPressed5() {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Calendar(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  void onPressed6() {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Task(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  // void onPressed1() {
  //   Navigator.of(context).pushAndRemoveUntil(
  //       PageRouteBuilder(
  //           pageBuilder: (context, animation, animation2) => Home(),
  //           transitionDuration: Duration(seconds: 0)),
  //       (route) => false);
  // }

  void onPressed2() {
    values.current_page = "progress";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => ProgressPage(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  void onPressed3() {
    values.current_page = "leaderboard";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Leaderboard(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  void onPressed4() {
    values.current_page = "profile";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Profile(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }
}
