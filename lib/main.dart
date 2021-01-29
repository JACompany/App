import 'dart:async';
import 'dart:ui';
import 'package:app/addTask.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'homepage.dart';
import 'globalValues.dart' as values;
import 'splash_screen.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (values.is_setup == false) setup();
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            home: Home(),
          );
        });
      },
    );
  }

  void setup() {
    values.is_setup = true;
    tz.initializeTimeZones();
    values.tasks_storage.read(";;;").then((readValues) {
      for (int i = 0; i < readValues.length; i++) {
        if (readValues.elementAt(i).length > 0) {
          List<String> object = readValues.elementAt(i).split(";");
          values.tasks.add(Task_Details(object[0], DateTime.parse(object[1]),
              DateTime.parse(object[2]), int.tryParse(object[3])));
        }
      }
    });
  }
}
