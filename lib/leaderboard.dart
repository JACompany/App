import 'dart:async';
import 'dart:ui';
import 'calendar.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'addTask.dart';
import 'globalValues.dart' as values;
import 'homepage.dart';
import 'progress_page.dart';
import 'package:sizer/sizer.dart';
import 'calendar.dart';

class Leaderboard extends StatefulWidget {
  @override
  _Leaderboard createState() => _Leaderboard();
}

class _Leaderboard extends State<Leaderboard> {
  bool get maintainState {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: values.color_green,
          title: Text(
            "Leaderboard",
            style: TextStyle(
              fontSize: 4.0.h,
            ),
          ),
          leading: IconButton(
            onPressed: null,
            icon: Icon(Icons.leaderboard),
            disabledColor: Colors.black,
            iconSize: 3.0.h,
          )),
      body: Text("Leaderboard"),
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
              icon: Icon(
                Icons.leaderboard,
                color: values.current_page == "leaderboard"
                    ? Colors.white
                    : Colors.black,
              ),
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
}
