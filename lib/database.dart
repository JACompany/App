//https://www.youtube.com/watch?v=DqJ_KjFzL9I

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'globalValues.dart' as values;

class database {
  List<Widget> list = [];
  void read() async {
    await values.firestore
        .collection("leaderboard")
        .get()
        .then((value) => value.docs.forEach((element) {
              list.add(ListTile(
                title: Text(element.get('name')),
                trailing: Text(element.get('score').toString()),
              ));
            }));
  }

  void write(double duration) async {
    await values.firestore.runTransaction((transaction) async {
      DocumentSnapshot docs = await transaction
          .get(values.firestore.collection("leaderboard").doc(values.userID));
      await transaction.update(
          values.firestore.collection("leaderboard").doc(values.userID),
          {'score': double.tryParse(docs['score'].toString()) + duration});
    });
  }
}
