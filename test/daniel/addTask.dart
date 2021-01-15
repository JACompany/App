import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'homepage.dart';
import 'globalValues.dart' as values;

class Task extends StatefulWidget {
  @override
  _Task createState() => _Task();
}

class _Task extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add task"),
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
              if (value.contains(";")) {
                return "Please remove ';' character";
              }
              setState(() {
                values.tasks.add(value);
                values.storage.write(values.tasks);
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
                      content: Text("Task added!"),
                      duration: Duration(milliseconds: 500),
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
