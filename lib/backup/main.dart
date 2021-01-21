import 'dart:ui';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'globalValues.dart' as values;
import 'splash_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: LoadingScreen(),
    );
  }
}
