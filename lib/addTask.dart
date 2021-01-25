import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'homepage.dart';
import 'globalValues.dart' as values;

//https://pub.dev/packages/flutter_time_picker_spinner
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
    var _dateTime = null;
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(15),
        color: values.color_peach,
        child: ListView(
          children: <Widget>[
            Text(
              "Description",
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              maxLines: null,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (value.contains(";")) {
                  return "Please remove ';' character";
                }
                setState(() {
                  values.tasks.add(value);
                  values.tasks_storage.write(values.tasks);
                });

                return null;
              },
            ),
            ElevatedButton(
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
          ],
        ),
      ),
    );
  }
}
