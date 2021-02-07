import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'leaderboard.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'globalValues.dart' as values;
import 'addTask.dart';
import 'package:sizer/sizer.dart';
import 'homepage.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Progress"),
          backgroundColor: values.color_green,
          leading: IconButton(
            onPressed: null,
            icon: Icon(Icons.insights),
            disabledColor: Colors.black,
          )),
      body: ListView(
        children: [ProgressBar(), TotalHours(), ProgressChart()],
      ),
      bottomNavigationBar: Container(
        height: 8.0.h,
        alignment: Alignment.bottomCenter,
        color: values.color_green,
        child: Row(
          children: [
            Expanded(
                child: IconButton(
              icon: Icon(Icons.timer),
              onPressed: onPressed1,
              iconSize: 6.0.h,
              color:
                  values.current_page == "home" ? Colors.white : Colors.black,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(
                Icons.insights,
                color: values.current_page == "progress"
                    ? Colors.white
                    : Colors.black,
              ),
              onPressed: onPressed2,
              iconSize: 6.0.h,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.leaderboard),
              onPressed: onPressed3,
              iconSize: 6.0.h,
              color: values.current_page == "leaderboard"
                  ? Colors.white
                  : Colors.black,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: onPressed4,
              iconSize: 6.0.h,
              color: values.current_page == "profile"
                  ? Colors.white
                  : Colors.black,
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

  Widget ProgressChart() {
    return Container(
        alignment: Alignment.centerRight,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "TRENDS",
            style: TextStyle(fontSize: 3.0.h),
          ),
          SizedBox(
            height: 1.0.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 5,
                height: 15.0.h,
                color: Colors.black,
              ),
              SizedBox(width: 4.0.w),
              Sparkline(
                data: values.past_hours,
                lineColor: values.color_red,
                pointsMode: PointsMode.all,
                pointSize: 2.5.h,
                pointColor: values.color_red,
              ),
            ],
          ),
          Container(
            width: 90.0.w,
            height: 5,
            color: Colors.black,
          ),
          SizedBox(
            height: 1.0.h,
          ),
          Align(
            child: Text(
              "Last 7 days",
              style: TextStyle(fontSize: 2.0.h),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: values.color_peach,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
        ));
  }

  Widget ProgressBar() {
    double _progress = values.user_hours_day / values.user_goal;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "DAILY PROGRESS",
              style: TextStyle(fontSize: 3.0.h),
            ),
          ),
          SizedBox(
            height: 1.0.h,
          ),
          LinearProgressIndicator(
            minHeight: 2.5.h,
            backgroundColor: Colors.grey[300],
            valueColor: new AlwaysStoppedAnimation<Color>(values.color_red),
            value: _progress,
          ),
          SizedBox(
            height: 1.0.h,
          ),
          Text(
            '${(_progress * 100).round()}%',
            style: TextStyle(
              fontSize: 2.5.h,
              color: values.color_red,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: values.color_peach,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)),
      ),
    );
  }

  Widget TotalHours() {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TOTAL PRODUCTIVE HOURS",
              style: TextStyle(fontSize: 3.0.h),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Text(
              "Today: " + values.user_hours_day.toStringAsFixed(1),
              style: TextStyle(
                color: values.color_red,
                fontSize: 2.5.h,
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Text(
              "All time: " + values.total_hours.toStringAsFixed(1),
              style: TextStyle(
                color: values.color_red,
                fontSize: 2.5.h,
              ),
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: values.color_peach,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
        ));
  }
}
