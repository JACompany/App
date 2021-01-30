import 'package:app/leaderboard.dart';
import 'package:app/profile.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
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
            // Expanded(
            //     child: IconButton(
            //   icon: Icon(Icons.leaderboard),
            //   onPressed: onPressed3,
            //   iconSize: 6.0.h,
            //   color: values.current_page == "leaderboard"
            //       ? Colors.white
            //       : Colors.black,
            // )),
            // Expanded(
            //     child: IconButton(
            //   icon: Icon(Icons.account_circle),
            //   onPressed: onPressed4,
            //   iconSize: 6.0.h,
            //   color: values.current_page == "profile"
            //       ? Colors.white
            //       : Colors.black,
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

  Widget ProgressChart() {
    return Container(
        child: Column(
          children: [
            Text(
              "Progress Chart",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, color: Colors.blue),
            ),
            SizedBox(height: 10),
            Expanded(
              child: LineChart(
                LineChartData(lineBarsData: [
                  LineChartBarData(
                    colors: [Colors.blue],
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(2, 2),
                      FlSpot(3, 5),
                      FlSpot(4, 3.1),
                      FlSpot(5, 4),
                      FlSpot(6, 3),
                      FlSpot(7, 4),
                    ],
                    barWidth: 5,
                  ),
                ]),
              ),
            )
          ],
        ),
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 30.0, 10.0),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: values.color_peach,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0)),
        ));
  }

  Widget ProgressBar() {
    return Container(
        child: Text(
          "Progress Bar",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 50, color: Colors.blue),
        ),
        height: MediaQuery.of(context).size.height / 5,
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 30.0, 10.0),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: values.color_peach,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0)),
        ));
  }

  Widget TotalHours() {
    return Container(
        child: Text(
          "Total Hours",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 50, color: Colors.blue),
        ),
        height: MediaQuery.of(context).size.height / 5,
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 30.0, 10.0),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: values.color_peach,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0)),
        ));
  }
}
