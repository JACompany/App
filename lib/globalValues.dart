library values.globals;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'database.dart';
import 'addTask.dart';
import 'notifications.dart';
import 'storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:timezone/timezone.dart';

//productive hours
double total_hours;
double user_goal;
double user_hours_day;
List<double> past_hours = [];

// storing user tasks
final Storage tasks_storage = Storage("tasks");
List<Task_Details> tasks = [];
List<String> completed_tasks = [];
final Storage completed_tasks_storage = Storage("completed_tasks");
final Storage past_hours_storage = Storage("past_hours");
Task_Details current_task;
DateTime task_start_time;

//route settings
String current_page = "home"; //current page
Timer timer; //used keep pages updated

//initial setup
bool is_setup = false;
String userID;
Storage values_storage = Storage("values_storage");
bool is_intial_setup;

//firebase (database)
final FirebaseFirestore firestore = FirebaseFirestore.instance;
database firebase_commands = database();
//notifications
FlutterLocalNotificationsPlugin notifcation;
Notifications notification_launcher = Notifications();
int notificationID;

//theme data
final color_green = Color.fromARGB(255, 153, 225, 217);
final color_red = Color.fromARGB(255, 241, 86, 124);
final color_peach = Color.fromARGB(255, 254, 239, 221);
