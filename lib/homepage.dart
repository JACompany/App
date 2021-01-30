import 'dart:async';
import 'dart:ui';
import 'package:app/calendar.dart';
import 'package:app/leaderboard.dart';
import 'package:app/lock_screen.dart';
import 'package:app/profile.dart';
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
                icon: Icon(Icons.calendar_today),
                onPressed: onPressed5,
                iconSize: 6.0.h,
              ),
              Text(
                "THU DEC 10",
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
            // Expanded(
            //     child: IconButton(
            //   icon: Icon(Icons.leaderboard),
            //   onPressed: onPressed3,
            //   iconSize: 6.0.h,
            // )),
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

  void onPressed5() {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Calendar(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  void onPressed6() {
    values.timer.cancel();
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

  void onPressed4() {
    values.current_page = "profile";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Profile(),
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
        // trailing: IconButton(
        //   //https://www.warmodroid.xyz/tutorial/flutter/popup-menu-in-flutter/ for the run task, edit, and delete buttons
        //   icon: Icon(Icons.delete),
        //   onPressed: () {
        //     setState(() {
        //       values.tasks.removeAt(index);
        //       values.tasks_storage.write(values.tasks);
        //     });
        //   },
        // ),
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
              break;
            case 2:
              break;
            case 3:
              values.tasks.removeAt(index);
              values.tasks_storage.write(values.tasks);
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
}
