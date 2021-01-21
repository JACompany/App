import 'dart:ui';

import 'package:flutter/material.dart';
import 'globalValues.dart' as values;
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

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
<<<<<<< HEAD
        child: Sparkline(
          data: values.past_hours,
          lineWidth: 5.0,
          lineColor: Colors.blue,
          pointsMode: PointsMode.all,
          pointSize: 12.0,
          pointColor: Colors.amber,
          fillMode: FillMode.below,
          fillGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[300], Colors.grey],
          ),
        ),
      ),
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'WEEK 1';
              case 5:
                return 'WEEK 2';
              case 8:
                return 'WEEK 3';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 35,
          margin: 12,
        ),
      );
=======
        child: LineChart(LineChartData(lineBarsData: [
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
>>>>>>> 8df3b4576f3c650703ed1074930eb615c6d24c9e
}
