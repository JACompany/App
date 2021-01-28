import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'package:sizer/sizer.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Text('Total Productive Hours:  ' + '15 Hours',
                    style: TextStyle(
                        fontFamily: 'Comic Sans MS',
                        fontSize: 4.0.h,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[300])),
                padding: EdgeInsets.fromLTRB(120.0, 100.0, 120.0, 100.0),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                        bottomLeft: const Radius.circular(40.0),
                        bottomRight: const Radius.circular(40.0)))),
          ],
        ),
      ),
    );
  }
}
