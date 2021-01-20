import 'dart:ui';

import 'package:flutter/material.dart';
import 'globalValues.dart' as values;
import 'package:flutter_sparkline/flutter_sparkline.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jimmy Test File',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
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
        child: Sparkline(
          data: values.past_hours,
          lineWidth: 5.0,
          lineColor: Colors.blue,
          pointsMode: PointsMode.all,
          pointSize: 12.0,
          pointColor: Colors.amber,
          fillMode: FillMode.below,
          fillGradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[300], Colors.grey],
          ),
        ),
      ),
    );
  }
}
