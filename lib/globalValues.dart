library values.globals;

import 'package:app/storage.dart';

//productive hours
const int total_hours = 0;
const int user_goal = 0;
const int user_hours_day = 0;

// storing user tasks
final Storage tasks_storage = Storage("tasks");
final List<String> tasks = <String>[];
