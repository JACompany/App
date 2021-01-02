import 'dart:ui';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'globalValues.dart' as values;

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    values.tasks.add(values.storage.read());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
