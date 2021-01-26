import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'homepage.dart';
import 'globalValues.dart' as values;
import 'splash_screen.dart';

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
    values.tasks_storage.read().then((readValues) {
      for (int i = 0; i < readValues.length; i++) {
        if (readValues.elementAt(i).length > 0) {
          values.tasks.add(readValues.elementAt(i));
        }
      }
    });
  }
}
