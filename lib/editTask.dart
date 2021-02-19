import 'dart:ui';
import 'leaderboard.dart';
import 'profile.dart';
import 'progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'calendar.dart';
import 'homepage.dart';
import 'package:sizer/sizer.dart';
import 'globalValues.dart' as values;
import 'addTask.dart';

//https://pub.dev/packages/flutter_time_picker_spinner
class EditTask extends StatefulWidget {
  int index;
  EditTask(this.index);
  @override
  _EditTask createState() => _EditTask(index);
}

class _EditTask extends State<EditTask> {
  int index;
  _EditTask(this.index);
  final _formKey = GlobalKey<FormState>();
  DateTime start, end;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
        backgroundColor: values.color_green,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: onPressed1,
          iconSize: 3.0.h,
        ),
      ),
      body: Container(
        color: values.color_peach,
        margin: EdgeInsets.all(2.0.w),
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
              ),
            ),
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
            Expanded(
                child: IconButton(
              icon: Icon(Icons.leaderboard),
              onPressed: onPressed3,
              iconSize: 6.0.h,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: onPressed4,
              iconSize: 6.0.h,
            ))
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
          initialValue: values.tasks[index].description,
          maxLines: null,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            if (value.contains(";")) {
              return "Please remove ';' character";
            }
            if (this.start.isAfter(this.end)) {
              return "Start time must be before end time";
            }
            if (this.start.isBefore(DateTime.now())) {
              return "Start time must be after the current time";
            }
            values.user_goal -= values.tasks[index].duration / 3600.0;
            values.tasks[index].update(value, start, end);
            values.user_goal += values.tasks[index].duration / 3600.0;
            values.notification_launcher
                .cancelNotification(values.tasks[index].notification_id);

            if (this
                .start
                .subtract(Duration(minutes: 5))
                .isAfter(DateTime.now())) {
              values.notification_launcher.showNotification(
                  "Improvall Productivity App",
                  value,
                  values.tasks[index].notification_id,
                  this.start.subtract(Duration(minutes: 5)));
            } else {
              values.notification_launcher.showNotification(
                  "Improvall Productivity App",
                  value,
                  values.tasks[index].notification_id,
                  this.start);
            }
            sortList();
            values.tasks_storage.write(values.tasks);
            values.values_storage.write_all_values();
            return null;
          },
        ),
      ),
    );
  }

  void sortList() {
    for (int i = 0; i < values.tasks.length - 1; i++) {
      for (int j = 0; j < values.tasks.length - i - 1; j++) {
        if (values.tasks[j].start.isAfter(values.tasks[j + 1].start)) {
          Task_Details temp = values.tasks[j];
          values.tasks[j] = values.tasks[j + 1];
          values.tasks[j + 1] = temp;
        }
      }
    }
  }

  Widget setStartTime() {
    return TimePickerSpinner(
      time: values.tasks[index].start,
      is24HourMode: false,
      normalTextStyle: TextStyle(fontSize: 2.0.h, color: Colors.black),
      highlightedTextStyle: TextStyle(fontSize: 3.0.h, color: values.color_red),
      spacing: 10.0.w,
      itemHeight: 7.0.h,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {
          this.start = DateTime.parse(time.toString().substring(0, 16));
        });
      },
    );
  }

  Widget setEndTime() {
    return TimePickerSpinner(
      time: values.tasks[index].end,
      is24HourMode: false,
      normalTextStyle: TextStyle(fontSize: 2.0.h, color: Colors.black),
      highlightedTextStyle: TextStyle(fontSize: 3.0.h, color: values.color_red),
      spacing: 10.0.w,
      itemHeight: 7.0.h,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {
          this.end = DateTime.parse(time.toString().substring(0, 16));
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
              content: Text("Task Saved!"),
              duration: Duration(milliseconds: 500),
            ),
          );
          Navigator.of(context).pushAndRemoveUntil(
              PageRouteBuilder(
                  pageBuilder: (context, animation, animation2) => Home(),
                  transitionDuration: Duration(seconds: 0)),
              (route) => false);
        }
      },
      child: Text(
        'Save',
        style: TextStyle(color: Colors.black, fontSize: 3.0.h),
      ),
    );
  }
}
