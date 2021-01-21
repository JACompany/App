import 'dart:ui';

import 'package:flutter/material.dart';
import 'globalValues.dart' as values;
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jimmy Test File',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: "Arial",
        brightness: Brightness.light,
      ),
      home: ProgressGraph(),
    );
  }
}

class ProgressGraph extends StatefulWidget {
  @override
  _ProgressGraph createState() => _ProgressGraph();
}

class _ProgressGraph extends State<ProgressGraph> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        child: LineChart(LineChartData(lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(2, 2),
              FlSpot(3, 5),
              FlSpot(4, 3.1),
              FlSpot(5, 4),
              FlSpot(6, 3),
              FlSpot(7, 4),
            ],
          ),
        ])),
        // child: Sparkline(
        //   data: values.past_hours,
        //   lineWidth: 8.0,
        //   lineColor: Colors.blue,
        //   pointsMode: PointsMode.all,
        //   pointSize: 16.0,
        //   pointColor: Colors.grey,
        // ),
      ),
    );
  }

  LineChartBarData linesBarData1() {
    return LineChartBarData(spots: [
      FlSpot(1, 1),
      FlSpot(3, 1.5),
      FlSpot(5, 1.4),
      FlSpot(7, 3.4),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ]);
  }
}
