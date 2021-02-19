import 'dart:async';
import 'dart:ui';
import 'package:intl/intl.dart';

import 'calendar.dart';
import 'completed_tasks.dart';
import 'editTask.dart';
import 'leaderboard.dart';
import 'lock_screen.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'addTask.dart';
import 'globalValues.dart' as values;
import 'progress_page.dart';
import 'package:sizer/sizer.dart';
import 'calendar.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: values.color_green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.check),
                onPressed: onPressed5,
                iconSize: 6.0.h,
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 4.0.h,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: onPressed6,
                iconSize: 6.0.h,
              ),
            ],
          )),
      body: tasks(),
      bottomNavigationBar: Container(
        height: 8.0.h,
        alignment: Alignment.bottomCenter,
        color: values.color_green,
        child: Row(
          children: [
            Expanded(
                child: IconButton(
              icon: Icon(
                Icons.timer,
                color:
                    values.current_page == "home" ? Colors.white : Colors.black,
              ),
              onPressed: onPressed1,
              iconSize: 6.0.h,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.insights),
              onPressed: onPressed2,
              iconSize: 6.0.h,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.leaderboard),
              onPressed: onPressed3,
              iconSize: 6.0.h,
            )),
            // Expanded(
            //     child: IconButton(
            //   icon: Icon(Icons.account_circle),
            //   onPressed: onPressed4,
            //   iconSize: 6.0.h,
            // ))
          ],
        ),
      ),
    );
  }

//needs testing https://cs.uwaterloo.ca/~alopez-o/math-faq/node73.html
  int getMonth(String month) {
    int m = 0;
    switch (month) {
      case "01":
        m = 11;
        break;
      case "02":
        m = 12;
        break;
      case "03":
        m = 1;
        break;
      case "04":
        m = 2;
        break;
      case "05":
        m = 3;
        break;
      case "06":
        m = 4;
        break;
      case "07":
        m = 5;
        break;
      case "08":
        m = 6;
        break;
      case "09":
        m = 7;
        break;
      case "10":
        m = 8;
        break;
      case "11":
        m = 9;
        break;
      case "12":
        m = 10;
        break;
    }
    return m;
  }

  String getMonthAsString(int month) {
    List<String> months = [
      "JAN",
      "FEB",
      "MAR",
      "APR",
      "MAY",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC"
    ];
    return months[month - 1];
  }

  String getDateAsString(int day) {
    List<String> dates = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
    return dates[day];
  }

  String get date {
    return DateFormat("MMMEd")
        .format(DateTime.now())
        .toUpperCase()
        .replaceAll(",", "");
  }

  // String get date2 {
  //   String current = DateTime.now().toString().substring(0, 10);
  //   String year = current.substring(0, 4);
  //   String month = current.substring(5, 7);
  //   String day = current.substring(8, 10);
  //   int k = int.parse(day);
  //   int m = getMonth(month);
  //   int c = 20;
  //   int y = int.parse(year);
  //   int w = (k +
  //           (2.6 * m - 0.2).floor() -
  //           2 * c +
  //           y +
  //           (y / 4).floor() +
  //           (c / 4).floor())
  //       .modInverse(7);
  //   m = int.parse(month);
  //   return getDateAsString(w) + " " + getMonthAsString(m) + " " + k.toString();
  // }

  void onPressed5() {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Completed_Task(),
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

  void onPressed1() {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Home(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

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

  Widget tasks() {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.transparent,
        height: 1.0.h,
      ),
      padding: EdgeInsets.all(2.0.w),
      itemCount: values.tasks.length,
      itemBuilder: (context, index) {
        return buildTile(values.tasks[index].description,
            values.tasks[index].start, values.tasks[index].end, index);
      },
    );
  }

  String formatTime(DateTime time) {
    String str;
    if (time.toString().substring(11, 13) == "00") {
      str = "12" + time.toString().substring(13, 16) + "am";
    } else if (time
        .isBefore(DateTime(time.year, time.month, time.day, 12, 0))) {
      str = time.toString().substring(11, 16) + "am";
    } else if (time
        .isAfter(DateTime(time.year, time.month, time.day, 12, 59))) {
      int hours = int.parse(time.toString().substring(11, 13)) - 12;
      str = hours.toString() + time.toString().substring(13, 16) + "pm";
    } else {
      str = time.toString().substring(11, 16) + "pm";
    }
    if (int.parse(str[0]) == 0) str = str.substring(1);
    return str;
  }

  Widget buildTile(String text, DateTime start, DateTime end, index) {
    return Container(
      decoration: BoxDecoration(
          color: values.color_peach,
          borderRadius: BorderRadius.all(Radius.circular(2.0.w))),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatTime(start) + '-' + formatTime(end),
              style: TextStyle(fontSize: 4.0.h, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 100.0.w,
              height: 0.25.h,
              color: values.color_peach,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 4.0.h),
            )
          ],
        ),
        trailing: options(index),
      ),
    );
  }

  Widget options(int index) {
    return PopupMenuButton(
        color: values.color_green,
        onSelected: (value) {
          switch (value) {
            case 1:
              values.current_task = values.tasks[index];
              values.task_start_time = DateTime.now();
              values.notification_launcher
                  .cancelNotification(values.tasks[index].notification_id);
              values.current_page = "lockscreen";
              Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                      pageBuilder: (context, animation, animation2) =>
                          LockScreen(),
                      transitionDuration: Duration(seconds: 0)),
                  (route) => false);
              break;
            case 2:
              Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                      pageBuilder: (context, animation, animation2) =>
                          EditTask(index),
                      transitionDuration: Duration(seconds: 0)),
                  (route) => false);
              break;
            case 3:
              setState(() {
                values.notification_launcher
                    .cancelNotification(values.tasks[index].notification_id);
                values.user_goal -= values.tasks[index].duration / 3600.0;
                values.tasks.removeAt(index);
                if (values.tasks.length == 0) {
                  values.user_hours_day = 0;
                  values.user_goal = 0;
                }
                values.values_storage.write_all_values();
                values.tasks_storage.write(values.tasks);
              });
              break;
          }
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(0.5.w, 0.5.w, 2.0.w, 0.5.w),
                        child: Icon(Icons.play_arrow),
                      ),
                      Text('Start')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(0.5.w, 0.5.w, 2.0.w, 0.5.w),
                        child: Icon(Icons.edit),
                      ),
                      Text('Edit')
                    ],
                  )),
              PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.delete),
                      ),
                      Text('Delete')
                    ],
                  )),
            ]);
  }
  // void onPressed4() {
  //   values.current_page = "profile";
  //   Navigator.of(context).pushAndRemoveUntil(
  //       PageRouteBuilder(
  //           pageBuilder: (context, animation, animation2) => Profile(),
  //           transitionDuration: Duration(seconds: 0)),
  //       (route) => false);
  // }
}
