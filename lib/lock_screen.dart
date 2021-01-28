import 'dart:ui';

import 'package:flutter/material.dart';
import 'globalValues.dart' as values;
import 'package:sizer/sizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: "Arial",
        brightness: Brightness.light,
      ),
      home: LockScreen(),
    );
  }
}

class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [lock()],
      ),
    );
  }

  Widget lock() {
    return Icon(
      Icons.lock,
      size: 10.0.h,
    );
  }

  Widget title() {}
  Widget timer() {}
  Widget time_remaining() {}
  Widget unlock() {}
}
