import 'globalValues.dart' as values;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Bar',
      home: _LinearProgressIndicatorApp(),
    );
  }
}

class _LinearProgressIndicatorApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LinearProgressIndicatorAppState();
  }
}

class _LinearProgressIndicatorAppState
    extends State<_LinearProgressIndicatorApp> {
  double _progress = values.user_hours_day / values.user_goal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Bar'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearProgressIndicator(
                minHeight: 20.0,
                backgroundColor: Colors.cyanAccent,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                value: _progress,
              ),
              Text('${(_progress * 100).round()}%'),
            ],
          ),
        ),
      ),
    );
  }
}
