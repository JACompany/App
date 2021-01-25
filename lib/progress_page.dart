import 'package:app/backup/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'globalValues.dart' as values;
import 'addTask.dart';
import 'package:sizer/sizer.dart';

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
          leading: IconButton(
            icon: Icon(Icons.insights),
            onPressed: null,
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
    Navigator.of(context).pop();
  }

  void onPressed2() {}
  void onPressed3() {}
  void onPressed4() {}

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
