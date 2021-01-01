import 'dart:ui';
import 'package:flutter/material.dart';
import 'test_addTask.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _tasks = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: onPressed)],
      ),
      body: tasks(),
    );
  }

  void onPressed() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return Task();
      }),
    );
  }

  Widget tasks() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return buildTile(_tasks[index], index);
      },
    );
  }

  Widget buildTile(String text, index) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            _tasks.removeAt(index);
          });
        },
      ),
    );
  }
}
