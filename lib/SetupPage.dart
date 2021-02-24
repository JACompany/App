import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'calendar.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'addTask.dart';
import 'globalValues.dart' as values;
import 'homepage.dart';
import 'progress_page.dart';
import 'package:sizer/sizer.dart';
import 'calendar.dart';

class SetupPage extends StatefulWidget {
  @override
  _SetupPage createState() => _SetupPage();
}

class _SetupPage extends State<SetupPage> {
  bool get maintainState {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: values.color_peach,
      appBar: AppBar(
          backgroundColor: values.color_green,
          title: Text(
            "Setup",
            style: TextStyle(
              fontSize: 4.0.h,
            ),
          ),
          leading: IconButton(
            onPressed: null,
            icon: Icon(Icons.settings),
            disabledColor: Colors.black,
            iconSize: 4.0.h,
          )),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: TextStyle(fontSize: 4.0.h, color: Colors.black),
            ),
            SizedBox(height: 0.5.h),
            form(),
            SizedBox(height: 0.5.h),
            submit_button(),
            SizedBox(height: 0.5.h),
            Text(
              'Usernames cannot be changed. Inappropriate usernames will be removed.',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 2.0.h,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  final _controller = TextEditingController();
  Widget form() {
    return TextField(
      controller: _controller,
    );
  }

  Future<String> checkValue(String value) async {
    if (value.isEmpty) return "Please enter a username";
    String s = null;
    await addUser(value).then((value) {
      if (value == false) {
        s = "Username taken.";
      }
    });
    return s;
  }

  Widget submit_button() {
    return OutlinedButton(
      onPressed: () async {
        await checkValue(_controller.text).then((value) {
          if (value == null) {
            values.current_page = "home";
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("User added!"),
                duration: Duration(milliseconds: 2000),
              ),
            );
            values.is_intial_setup = true;
            values.values_storage.write_all_values();
            Navigator.of(context).pushAndRemoveUntil(
                PageRouteBuilder(
                    pageBuilder: (context, animation, animation2) => Home(),
                    transitionDuration: Duration(seconds: 0)),
                (route) => false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Username taken."),
                duration: Duration(milliseconds: 2000),
              ),
            );
          }
        });
      },
      child: Text(
        'Set Username',
        style: TextStyle(color: Colors.black, fontSize: 3.0.h),
      ),
    );
  }

  Future<bool> addUser(value) async {
    bool ret = false;
    await userAvailable(value).then((value) {
      if (value == false) {
        ret = true;
      }
    });
    if (ret == true) {
      return false;
    }
    await values.firestore.collection("leaderboard").add({
      'username': value,
      'score': 0,
    }).then((value) {
      values.userID = value.id;
      ret = true;
    }, onError: (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error adding user, please try again. "),
          duration: Duration(milliseconds: 1000),
        ),
      );
      ret = false;
    });
    return ret;
  }

  Future<bool> userAvailable(String value) async {
    bool ret = true;
    await values.firestore
        .collection("leaderboard")
        .get()
        .then((users) => users.docs.forEach((element) {
              if (element.data()['username'] == value) {
                ret = false;
                ;
              }
            }));
    return ret;
  }
}
