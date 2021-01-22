import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared preferences demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Progress'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _displayMinutes;
  String _displayhour;
  Timer _everySecond;
  intl.DateFormat dateFormat = new intl.DateFormat.Hms();

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if (prefs.getInt('storeMinutes') == null) {
        _displayMinutes = 0;
      } else if (prefs.getInt('storeMinutes') == 0) {
        _displayMinutes = 0;
      } else {
        _displayMinutes = prefs.getInt('storeMinutes');
      }

      _displayhour = (_displayMinutes ~/ 60).toString().padLeft(2, "0");
    });

    _everySecond = Timer.periodic(Duration(seconds: 60), (Timer t) {
      _incrementCounter();
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!mounted) return;
    setState(() {
      _displayMinutes = _displayMinutes + 100;
      _displayhour = (_displayMinutes ~/ 60).toString().padLeft(2, "0");
      prefs.setInt('storeMinutes', _displayMinutes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[ProgressChart()],
        ),
      ),
    );
  }

  Widget ProgressChart() {
    return Container(
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
        height: MediaQuery.of(context).size.height / 3,
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
        height: MediaQuery.of(context).size.height / 3,
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
