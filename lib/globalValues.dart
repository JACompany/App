library values.globals;

import 'package:app/storage.dart';
import 'package:flutter/cupertino.dart';

//productive hours
const double total_hours = 0;
const double user_goal = 0;
const double user_hours_day = 0;
const List<double> past_hours = [2.0, 3.0, 5.4, 1.1, 7.4, 4.5, 2.2];

// storing user tasks
final Storage tasks_storage = Storage("tasks");
final List<String> tasks = <String>[];

//route settings
String current_page = "home";

//theme data
final color_green = Color.fromARGB(255, 153, 225, 217);
final color_red = Color.fromARGB(255, 247, 86, 124);
