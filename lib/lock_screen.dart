import 'dart:ui';

import 'package:app/addTask.dart';
import 'package:flutter/material.dart';
import 'globalValues.dart' as values;
import 'package:sizer/sizer.dart';

class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
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
        values.current_task.duration[0].toString() +
            ":" +
            values.current_task.duration[1].toString(),
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
}
