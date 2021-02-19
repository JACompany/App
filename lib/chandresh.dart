import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'globalValues.dart' as values;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(leaderboard());
}

class leaderboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _leaderboard();
}

class _leaderboard extends State<leaderboard> {
  void initState() {
    super.initState();
    values.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        read();
      });
    });
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Leaderboard"),
        ),
        body: tiles(context),
      ),
    );
  }

  List<Widget> list = [];
  read() async {
    await firestore
        .collection("leaderboard")
        .get()
        .then((value) => value.docs.forEach((element) {
              list.add(
                ListTile(
                  trailing: Text(element.get('score').toString(),
                      style: TextStyle(
                        fontFamily: 'Comic Sans MS',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  title: Text(element.get('username'),
                      style: TextStyle(
                          fontFamily: 'Comic Sans MS',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decorationColor: Colors.green)),
                ),
              );
            }));
  }

  ListView tiles(context) {
    read();
    return ListView(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      children: list,
    );
  }
}
