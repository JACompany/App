import 'dart:ui';

import 'addTask.dart';
import 'package:flutter/material.dart';
import 'globalValues.dart' as values;
import 'package:sizer/sizer.dart';

class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  List<int> duration = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          timerText(),
          timer(),
          SizedBox(
            height: 2.0.h,
          ),
          icon(),
          SizedBox(
            height: 2.0.h,
          ),
          title(),
          SizedBox(
            height: 2.0.h,
          ),
          unlock()
        ],
      ),
    );
  }

  Widget timer() {
    return Container(
      color: values.color_green,
      alignment: Alignment.center,
      child: Text(
        duration[0].toString() +
            ":" +
            duration[1].toString() +
            ":" +
            duration[2].toString(),
        style: TextStyle(fontSize: 4.0.h),
      ),
    );
  }

  Widget title() {
    return Container(
      color: values.color_green,
      padding: EdgeInsets.fromLTRB(0, 2.0.h, 0, 2.0.h),
      alignment: Alignment.center,
      child: Text(
        "do homework ",
        style: TextStyle(fontSize: 4.0.h),
      ),
    );
  }

  Widget icon() {
    return Icon(
      Icons.timer,
      size: 40.0.h,
      color: values.color_red,
    );
  }

  Widget timerText() {
    return Container(
      color: values.color_green,
      padding: EdgeInsets.fromLTRB(0, 1.0.h, 0, 0),
      alignment: Alignment.center,
      child: Text(
        "TIME REMAINING",
        style: TextStyle(fontSize: 4.0.h),
      ),
    );
  }

  Widget unlock() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "EMERGENCY UNLOCK ",
        style: TextStyle(fontSize: 3.0.h, color: values.color_red),
      ),
    );
  }

  List<int> findDuration() {
    int seconds = values.current_task.end_time
        .difference(values.current_task.start_time)
        .inSeconds
        .abs();
    int minutes = seconds ~/ 60;
    int hours = minutes ~/ 60;
    minutes = minutes - (hours * 60);
    seconds = seconds - (hours * 60 * 60) - (minutes * 60);
    return [hours, minutes, seconds];
  }
}
