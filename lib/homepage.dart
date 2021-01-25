import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'addTask.dart';
import 'globalValues.dart' as values;
import 'progress_page.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    values.tasks_storage.read().then((readValues) {
      for (int i = 0; i < readValues.length; i++) {
        if (readValues.elementAt(i).length > 0) {
          values.tasks.add(readValues.elementAt(i));
        }
      }
    });
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: values.color_green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: onPressed,
                iconSize: 6.0.h,
              ),
              Text(
                "THU DEC 10",
                style: TextStyle(
                  fontSize: 4.0.h,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: onPressed,
                iconSize: 6.0.h,
              )
            ],
          )),
      body: tasks(),
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
                color:
                    values.current_page == "home" ? Colors.white : Colors.black,
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

  void onPressed5() {}
  void onPressed6() {}
  void onPressed() {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Task(),
            transitionDuration: Duration(seconds: 0)));
  }

  void onPressed1() {}

  void onPressed2() {
    values.current_page = "progress";
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => ProgressPage(),
            transitionDuration: Duration(seconds: 0)));
  }

  void onPressed3() {}
  void onPressed4() {}

  Widget tasks() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: values.tasks.length,
      itemBuilder: (context, index) {
        return buildTile(values.tasks[index], index);
      },
    );
  }

  Widget buildTile(String text, index) {
    return Container(
      color: values.color_red,
      child: ListTile(
        tileColor: values.color_red,
        title: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              values.tasks.removeAt(index);
              values.tasks_storage.write(values.tasks);
            });
          },
        ),
      ),
    );
  }
}
