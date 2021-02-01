library values.globals;

import 'dart:async';

import 'addTask.dart';
import 'storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:timezone/timezone.dart';

//productive hours
const double total_hours = 15.2487;
const double user_goal = 20;
const double user_hours_day = 5;
const List<double> past_hours = [2.0, 3.0, 5.4, 1.1, 7.4, 4.5, 2.2];

// storing user tasks
final Storage tasks_storage = Storage("tasks");
final List<Task_Details> tasks = [];
Task_Details current_task = null;
TZDateTime task_start_time;

//route settings
String current_page = "home"; //current page
Timer timer; //used keep pages updated

//initial setup
bool is_setup = false;

//theme data
final color_green = Color.fromARGB(255, 153, 225, 217);
final color_red = Color.fromARGB(255, 241, 86, 124);
final color_peach = Color.fromARGB(255, 254, 239, 221);
