import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'calendar.dart';
import 'homepage.dart';
import 'package:sizer/sizer.dart';
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
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: null,
          disabledColor: Colors.black,
        ),
      ),
      body: Container(
        color: values.color_peach,
        margin: EdgeInsets.all(15),
        child: ListView(
          children: [addTask(), setTime()],
        ),
      ),
      bottomNavigationBar: Container(
        height: 8.0.h,
        alignment: Alignment.bottomCenter,
        color: values.color_green,
        child: Row(
          children: [
            Expanded(
                child: IconButton(
              icon: Icon(
                Icons.timer,
              ),
              onPressed: onPressed1,
              iconSize: 6.0.h,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.insights),
              onPressed: onPressed2,
              iconSize: 6.0.h,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.leaderboard),
              onPressed: onPressed3,
              iconSize: 6.0.h,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: onPressed4,
              iconSize: 6.0.h,
            ))
          ],
        ),
      ),
    );
  }

  void onPressed1() {
    // Navigator.of(context).pop();
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Home(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  void onPressed2() {}
  void onPressed3() {}
  void onPressed4() {}

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
