import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'addTask.dart';
import 'globalValues.dart' as values;

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
        title: Text("Calendar"),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: onPressed)],
      ),
      body: tasks(),
      bottomSheet: Container(
        height: 70,
        alignment: Alignment.bottomCenter,
        color: Colors.blue,
        child: Row(
          children: [
            Expanded(
                child: IconButton(
              icon: Icon(Icons.timer),
              onPressed: onPressed,
              iconSize: 50,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.insights),
              onPressed: onPressed,
              iconSize: 50,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.leaderboard),
              onPressed: onPressed,
              iconSize: 50,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: onPressed,
              iconSize: 50,
            ))
          ],
        ),
      ),
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
      itemCount: values.tasks.length,
      itemBuilder: (context, index) {
        return buildTile(values.tasks[index], index);
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
            values.tasks.removeAt(index);
            values.tasks_storage.write(values.tasks);
          });
        },
      ),
    );
  }
}
