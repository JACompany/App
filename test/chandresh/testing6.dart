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
      title: 'Progress',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Shared preferences demo'),
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
  int _counter2;
  String _now;
  Timer _everySecond;
  intl.DateFormat dateFormat = new intl.DateFormat.Hms();

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(prefs.getInt('counter3'));
    print(' counter value : ' + prefs.getInt('counter3').toString());

    setState(() {
      if (prefs.getInt('counter3') == 0) {
        _counter2 = 0;
      } else {
        _counter2 = prefs.getInt('counter3');
      }
    });

    _everySecond = Timer.periodic(Duration(seconds: 60), (Timer t) {
      _incrementCounter();
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!mounted) return;
    setState(() {
      _counter2 = _counter2 + 1;
      prefs.setInt('counter3', _counter2);
      print('print counter2  : ' + _counter2.toString());
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
            Text(
              'Total Productive Hours',
            ),
            Text(
              '$_counter2' + ' mins',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
