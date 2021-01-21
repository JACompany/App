library values.globals;

import 'package:app/storage.dart';

//productive hours
const int total_hours = 0;
const int user_goal = 0;
const int user_hours_day = 0;
const List<double> past_hours = [2.0, 3.0, 5.4, 1.1, 7.4, 4.5, 2.2];

// storing user tasks
final Storage tasks_storage = Storage("tasks");
final List<String> tasks = <String>[];
