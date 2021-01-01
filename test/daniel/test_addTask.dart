import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Task extends StatefulWidget {
  @override
  _Task createState() => _Task();
}

class _Task extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Text("Testing App"),
    );
  }
}
