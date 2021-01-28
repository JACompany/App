import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'globalValues.dart' as values;

void main() => runApp(LineChartSample1());

class LineChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 100,
                        color: Colors.black,
                      ),
                      Sparkline(
                        data: values.past_hours,
                      )
                    ],
                  ),
                  Container(
                    width: 350,
                    height: 10,
                    color: Colors.black,
                  )
                ],
              ),
            )));
  }
}
