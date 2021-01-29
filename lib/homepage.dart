import 'dart:async';
import 'dart:ui';
import 'package:app/calendar.dart';
import 'package:app/leaderboard.dart';
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
  bool get maintainState {
    return false;
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

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
              )
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
            values.tasks[index].start_time, index);
      },
    );
  }

  Widget buildTile(String text, tz.TZDateTime time, index) {
    return Container(
      decoration: BoxDecoration(
          color: values.color_red,
          borderRadius: BorderRadius.all(Radius.circular(2.0.w))),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time.toString(),
              style: TextStyle(fontSize: 4.0.h, fontWeight: FontWeight.bold),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 4.0.h),
            )
          ],
        ),
        trailing: IconButton(
          //https://www.warmodroid.xyz/tutorial/flutter/popup-menu-in-flutter/ for the run task, edit, and delete buttons
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              values.tasks.removeAt(index);
              values.tasks_storage.write(values.tasks);
            });
          },
        ),
      ),
    );
  }
}
