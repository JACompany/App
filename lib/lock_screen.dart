import 'dart:async';
import 'dart:ui';

import 'homepage.dart';
import 'package:flutter/material.dart';
import 'globalValues.dart' as values;
import 'package:sizer/sizer.dart';

class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> with WidgetsBindingObserver {
  List<String> duration = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    duration = findDuration();
    WidgetsFlutterBinding.ensureInitialized();
    values.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        duration = findDuration();
        timer.cancel();
        if (values.current_page == "home") {
          Navigator.of(context).pushAndRemoveUntil(
              PageRouteBuilder(
                  pageBuilder: (context, animation, animation2) => Home(),
                  transitionDuration: Duration(seconds: 0)),
              (route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
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
            unlock(),
            SizedBox(
              height: 2.0.h,
            ),
            title(),
            SizedBox(
              height: 2.0.h,
            ),
          ],
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }

  Widget timer() {
    return Container(
      color: values.color_green,
      alignment: Alignment.center,
      child: Text(
        duration[0] + ":" + duration[1] + ":" + duration[2],
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
        values.current_task.description,
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
    return TextButton(
      onPressed: cancel,
      child: Text(
        "EMERGENCY UNLOCK ",
        style: TextStyle(fontSize: 3.0.h, color: values.color_red),
      ),
    );
  }

  void cancel() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          "Are you sure you want to leave the current task?",
        ),
        content: Text(
          "This will reset your current progress.",
        ),
        actions: [
          TextButton(onPressed: onPressed1, child: Text("No")),
          TextButton(onPressed: onPressed2, child: Text("Yes"))
        ],
      ),
    );
  }

  void onPressed1() {
    Navigator.of(context).pop();
  }

  void onPressed2() {
    values.task_start_time = null;
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Home(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  List<String> findDuration() {
    int seconds = values.current_task.end_time
        .difference(values.current_task.start_time)
        .inSeconds
        .abs();
    int time_passed =
        DateTime.now().difference(values.task_start_time).inSeconds.abs();
    seconds = seconds - time_passed;
    int minutes = seconds ~/ 60;
    int hours = minutes ~/ 60;
    minutes = minutes - (hours * 60);
    seconds = seconds - ((hours * 60 * 60) + (minutes * 60));
    String h = hours.toString(), m = minutes.toString(), s = seconds.toString();
    if (hours < 10) h = "0" + hours.toString();
    if (minutes < 10) m = "0" + minutes.toString();
    if (seconds < 10) s = "0" + seconds.toString();
    return [h, m, s];
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      dispose();
      values.current_page = "home";
      Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
              pageBuilder: (context, animation, animation2) => Home(),
              transitionDuration: Duration(seconds: 0)),
          (route) => false);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
