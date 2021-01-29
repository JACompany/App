import 'dart:ui';
import 'package:app/leaderboard.dart';
import 'package:app/profile.dart';
import 'package:app/progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'calendar.dart';
import 'homepage.dart';
import 'package:sizer/sizer.dart';
import 'globalValues.dart' as values;

//https://pub.dev/packages/flutter_time_picker_spinner
class Task extends StatefulWidget {
  @override
  _Task createState() => _Task();
}

class _Task extends State<Task> {
  final _formKey = GlobalKey<FormState>();
  tz.TZDateTime start, end;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: onPressed1,
          iconSize: 3.0.h,
        ),
      ),
      body: Container(
        color: values.color_peach,
        margin: EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
                color: values.color_green,
                alignment: Alignment.center,
                width: 100.0.w,
                height: 5.0.h,
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 3.0.h),
                )),
            addTask(),
            Container(
                color: values.color_green,
                alignment: Alignment.center,
                width: 100.0.w,
                height: 5.0.h,
                child: Text(
                  "Start time:",
                  style: TextStyle(fontSize: 3.0.h),
                )),
            setStartTime(),
            Container(
                color: values.color_green,
                alignment: Alignment.center,
                width: 100.0.w,
                height: 5.0.h,
                child: Text(
                  "End time:",
                  style: TextStyle(fontSize: 3.0.h),
                )),
            setEndTime(),
            submit_button(),
          ],
        ),
      ),
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

  void onPressed1() {
    values.current_page = "home";
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

  Widget addTask() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(15),
        color: values.color_peach,
        child: TextFormField(
          controller: controller,
          maxLines: null,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            if (value.contains(";")) {
              return "Please remove ';' character";
            }
            setState(() {
              values.tasks.add(Task_Details(value, this.start, this.end, 0));
              values.tasks_storage.write(values.tasks);
            });

            return null;
          },
        ),
      ),
    );
  }

  Widget setStartTime() {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(fontSize: 2.0.h, color: Colors.black),
      highlightedTextStyle: TextStyle(fontSize: 3.0.h, color: values.color_red),
      spacing: 10.0.w,
      itemHeight: 7.0.h,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {
          this.start = time;
        });
      },
    );
  }

  Widget setEndTime() {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(fontSize: 2.0.h, color: Colors.black),
      highlightedTextStyle: TextStyle(fontSize: 3.0.h, color: values.color_red),
      spacing: 10.0.w,
      itemHeight: 7.0.h,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {
          this.end = time;
        });
      },
    );
  }

  Widget submit_button() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => values.color_green)),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          controller.clear();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Task added!"),
              duration: Duration(milliseconds: 500),
            ),
          );
        }
      },
      child: Text(
        'Add task',
        style: TextStyle(color: Colors.black, fontSize: 3.0.h),
      ),
    );
  }
}

class Task_Details implements Comparable<Task_Details> {
  String description; //task description
  tz.TZDateTime start_time; //start time of task
  tz.TZDateTime end_time; //end time of tast
  int notification_id; //notification id for cancelling in the future
  Task_Details(String description, DateTime start_time, DateTime end_time,
      int notification_id) {
    this.description = description;
    this.start_time = tz.TZDateTime.from(start_time, tz.local);
    this.end_time = tz.TZDateTime.from(end_time, tz.local);
    this.notification_id = notification_id;
  }

  @override
  int compareTo(other) {
    return this.start_time.isBefore(other.start_time) ? 1 : -1;
  }

  @override
  String toString() {
    return description +
        ";" +
        start_time.toString() +
        ";" +
        end_time.toString() +
        ";" +
        notification_id.toString() +
        ";;;";
  }
}
