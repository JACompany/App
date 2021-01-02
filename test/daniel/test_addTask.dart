import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'test_homepage.dart';
import 'test_globalValues.dart' as values;

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
        leading:
            IconButton(icon: Icon(Icons.arrow_back), onPressed: _backPressed),
      ),
      body: addTask(),
    );
  }

  void _backPressed() {
    Navigator.of(context).pop();
  }

  Widget addTask() {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                values.tasks.add(value);
              });

              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Adding task..."),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              child: Text('Add task'),
            ),
          ),
        ],
      ),
    );
  }
}
