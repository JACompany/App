import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'globalValues.dart' as values;
import 'package:sizer/sizer.dart';

void main() => runApp(LineChartSample1());

class LineChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  get data => values.past_hours;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil().init(constraints, orientation);
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
                                SizedBox(width: 1.0.w),
                                Sparkline(
                                  data: values.past_hours,
                                )
                              ],
                            ),
                            new Sparkline(
                              data: values.past_hours,
                              pointsMode: PointsMode.all,
                              pointSize: 12.0,
                              pointColor: Colors.blue,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "testing",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Container(
                                  width: 350,
                                  height: 10,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ]))));
        });
      },
    );
  }
}
