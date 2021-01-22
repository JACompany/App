import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:shared_preferences/shared_preferences.dart';

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
      _displayMinutes = _displayMinutes + 1;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Text(
                    'Total Productive Hours  ' + '$_displayhour' + 'Hours',
                    style: TextStyle(
                        fontFamily: 'Comic Sans MS',
                        fontSize: 19,
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
