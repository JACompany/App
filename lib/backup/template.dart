import 'dart:ui';

import 'package:flutter/material.dart';
import 'globalValues.dart' as values;

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
  var hours = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jimmy Test",
          style: TextStyle(color: Colors.blue),
        ),
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Text("Total productive hours: " + hours.toString()),
    );
  }
}
