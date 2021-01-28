import 'dart:ui';

import 'package:flutter/material.dart';
import 'globalValues.dart' as values;
import 'package:sizer/sizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            home: LockScreen(),
          );
        });
      },
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
        children: [
          timer(),
          SizedBox(
            height: 2.0.h,
          ),
          icon(),
          SizedBox(
            height: 2.0.h,
          ),
          title(),
          SizedBox(
            height: 2.0.h,
          ),
          unlock()
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      color: values.color_green,
      padding: EdgeInsets.fromLTRB(0, 2.0.h, 0, 2.0.h),
      alignment: Alignment.center,
      child: Text(
        "do homework ",
        style: TextStyle(fontSize: 4.0.h),
      ),
    );
  }

  Widget icon() {
    return Icon(
      Icons.timer,
      size: 40.0.h,
      color: values.color_red,
    );
  }

  Widget timer() {
    return Container(
      color: values.color_green,
      padding: EdgeInsets.fromLTRB(0, 2.0.h, 0, 2.0.h),
      alignment: Alignment.center,
      child: Text(
        "TIME REMAINING ",
        style: TextStyle(fontSize: 4.0.h),
      ),
    );
  }

  Widget unlock() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "EMERGENCY UNLOCK ",
        style: TextStyle(fontSize: 3.0.h, color: values.color_red),
      ),
    );
  }
}
