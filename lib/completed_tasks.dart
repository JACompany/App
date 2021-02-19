import 'dart:async';
import 'dart:ui';
import 'calendar.dart';
import 'editTask.dart';
import 'homepage.dart';
import 'leaderboard.dart';
import 'lock_screen.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'addTask.dart';
import 'globalValues.dart' as values;
import 'progress_page.dart';
import 'package:sizer/sizer.dart';

class Completed_Task extends StatefulWidget {
  @override
  _Completed_Task createState() => _Completed_Task();
}

class _Completed_Task extends State<Completed_Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: values.color_green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onPressed5,
        ),
        title: Text("COMPLETED TASKS"),
      ),
      body: buildList(),
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

  // void onPressed4() {
  //   values.current_page = "profile";
  //   Navigator.of(context).pushAndRemoveUntil(
  //       PageRouteBuilder(
  //           pageBuilder: (context, animation, animation2) => Profile(),
  //           transitionDuration: Duration(seconds: 0)),
  //       (route) => false);
  // }

  void onPressed5() {
    values.current_page = "home";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Home(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: values.completed_tasks.length,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        margin: EdgeInsets.all(0.5.h),
        decoration: BoxDecoration(
          color: values.color_peach,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
        ),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                values.completed_tasks[index].split(";")[0],
                style: TextStyle(fontSize: 3.0.h),
              ),
              SizedBox(height: 2.0.h),
              Text(
                "Date completed: " +
                    values.completed_tasks[index]
                        .split(";")[1]
                        .replaceAll(";", ""),
                style: TextStyle(fontSize: 2.0.h),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => setState(() {
              values.completed_tasks.removeAt(index);
              values.completed_tasks_storage.write(values.completed_tasks);
            }),
          ),
        ),
      ),
    );
  }
}
