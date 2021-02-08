library values.globals;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'addTask.dart';
import 'notifications.dart';
import 'storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:timezone/timezone.dart';

//productive hours
const double total_hours = 15.2487;
const double user_goal = 20;
const double user_hours_day = 5;
const List<double> past_hours = [2.0, 3.0, 3.4, 1.1, 2.4, 3.5, 2.2];

// storing user tasks
final Storage tasks_storage = Storage("tasks");
final List<Task_Details> tasks = [];
final List<String> completed_tasks = [];
final Storage completed_tasks_storage = Storage("completed_tasks");
Task_Details current_task;
DateTime task_start_time;

//route settings
String current_page = "home"; //current page
Timer timer; //used keep pages updated

//initial setup
bool is_setup = false;
String userID = null;

//firebase (database)
final FirebaseFirestore firestore = FirebaseFirestore.instance;

//notifications
FlutterLocalNotificationsPlugin notifcation;
Notifications notification_launcher = Notifications();
int notificationID = 0;

//theme data
final color_green = Color.fromARGB(255, 153, 225, 217);
final color_red = Color.fromARGB(255, 241, 86, 124);
final color_peach = Color.fromARGB(255, 254, 239, 221);
