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
      color: Colors.white,
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
  List<charts.Series> get seriesList => null;

  get animate => null;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        child: 
        
        

            charts.LineChart(
      seriesList,
      animate: animate,
      // Configures four [ChartTitle] behaviors to render titles in each chart
      // margin. The top title has a sub-title, and is aligned to the left edge
      // of the chart. The other titles are aligned with the middle of the draw
      // area.
      behaviors: [
        new charts.ChartTitle('hry',
            subTitle: 'Top sub-title text',
            behaviorPosition: charts.BehaviorPosition.top,
            titleOutsideJustification: charts.OutsideJustification.start,
            // Set a larger inner padding than the default (10) to avoid
            // rendering the text too close to the top measure axis tick label.
            // The top tick label may extend upwards into the top margin region
            // if it is located at the top of the draw area.
            innerPadding: 18),
        new charts.ChartTitle('Bottom title text',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('Start title',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('End title',
            behaviorPosition: charts.BehaviorPosition.end,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
      ],
       )
      
  }

 
  

        LineChart(LineChartData(lineBarsData: [
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
}
