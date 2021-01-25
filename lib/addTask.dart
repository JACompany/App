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
      body: Container(
        color: values.color_peach,
        margin: EdgeInsets.all(15),
        child: ListView(
          children: [addTask(), setTime()],
        ),
      ),
    );
  }

  void _backPressed() {
    Navigator.of(context).pop();
  }

  Widget addTask() {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(15),
        color: values.color_peach,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

  Widget setTime() {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(fontSize: 24, color: Colors.black),
      highlightedTextStyle: TextStyle(fontSize: 24, color: values.color_red),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {});
      },
    );
  }
}
