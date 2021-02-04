//https://www.youtube.com/watch?v=DqJ_KjFzL9I
import 'package:flutter/material.dart';

void main() => runApp(database());

class database extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Database"),
        ),
        body: ListView(
          children: [Text("Person 1")],
        ),
      ),
    );
  }
}
