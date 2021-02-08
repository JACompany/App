//https://www.youtube.com/watch?v=DqJ_KjFzL9I

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(database());
}

class database extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      list.add(ListTile(
        title: Text(element.get('name')),
        trailing: Text(element.get('score').toString()
        ),
      ));
    }));
  }

  ListView tiles(context) {
    // firestore.collection("leaderboard").snapshots().listen((result) {
    //   result.docs.forEach((element) {
    //     list.add(element.data());
    //   });
    // });
    read();
    return ListView(
      children: list,
    );
  }
}
