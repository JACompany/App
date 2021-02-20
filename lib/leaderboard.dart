import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'calendar.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'addTask.dart';
import 'globalValues.dart' as values;
import 'homepage.dart';
import 'progress_page.dart';
import 'package:sizer/sizer.dart';
import 'calendar.dart';

class Leaderboard extends StatefulWidget {
  @override
  _Leaderboard createState() => _Leaderboard();
}

class _Leaderboard extends State<Leaderboard> {
  bool get maintainState {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: values.color_green,
          title: Text(
            "Leaderboard",
            style: TextStyle(
              fontSize: 4.0.h,
            ),
          ),
          leading: IconButton(
            onPressed: null,
            icon: Icon(Icons.leaderboard),
            disabledColor: Colors.black,
            iconSize: 3.0.h,
          )),
      body: StreamBuilder(
        stream: values.firestore
            .collection('leaderboard')
            .orderBy('score', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          final List<DocumentSnapshot> documents = snapshot.data.docs;
          int count = 0;
          return ListView(
            children: documents.map((user) {
              count++;
              return ListTile(
                tileColor: pickColor(count),
                leading: Icon(
                  Icons.account_circle,
                  size: 5.0.h,
                ),
                title: pickText(user),
                subtitle: Text(
                  "Rank #" + count.toString(),
                  style: TextStyle(fontSize: 2.0.h),
                ),
                trailing: Text(
                  "Hours: " + user['score'].toStringAsFixed(1),
                  style: TextStyle(fontSize: 2.0.h),
                ),
              );
            }).toList(),
          );
        },
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
              icon: Icon(
                Icons.leaderboard,
                color: values.current_page == "leaderboard"
                    ? Colors.white
                    : Colors.black,
              ),
              onPressed: onPressed3,
              iconSize: 6.0.h,
            )),
            // Expanded(
            //     child: IconButton(
            //   icon: Icon(Icons.account_circle),
            //   onPressed: onPressed4,
            //   iconSize: 6.0.h,
            // ))
          ],
        ),
      ),
    );
  }

  void onPressed1() {
    values.current_page = "home";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Home(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  void onPressed2() {
    values.current_page = "progress";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => ProgressPage(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  void onPressed3() {
    values.current_page = "leaderboard";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Leaderboard(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  Color pickColor(int i) {
    if (i == 1) {
      return Color.fromRGBO(255, 215, 0, 0.5);
    }
    if (i == 2) {
      return Color.fromRGBO(168, 169, 173, 0.5);
    }
    if (i == 3) {
      return Color.fromRGBO(205, 127, 50, 0.5);
    }
    return values.color_peach;
  }

  pickText(DocumentSnapshot user) {
    if (user.id == values.userID) {
      return Text(
        user['username'] + " (You)",
        style: TextStyle(
            fontSize: 3.0.h,
            fontWeight: FontWeight.bold,
            color: values.color_red),
      );
    }
    return Text(
      user['username'],
      style: TextStyle(
        fontSize: 2.5.h,
      ),
    );
  }

  // void onPressed4() {
  //   values.current_page = "profile";
  //   Navigator.of(context).pushAndRemoveUntil(
  //       PageRouteBuilder(
  //           pageBuilder: (context, animation, animation2) => Profile(),
  //           transitionDuration: Duration(seconds: 0)),
  //       (route) => false);
  // }
}
