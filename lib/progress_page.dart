import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared preferences demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ProgressPage(title: 'Progress'),
    );
  }
}

class ProgressPage extends StatefulWidget {
  ProgressPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[ProgressBar(), TotalHours(), ProgressChart()],
        ),
      ),
    );
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
          color: Colors.orange[100],
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
          color: Colors.orange[100],
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
          color: Colors.orange[100],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0)),
        ));
  }
}
