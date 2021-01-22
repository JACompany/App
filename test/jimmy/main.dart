// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
  var _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>();
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
      body: Text("Test"),
    );
  }
}
