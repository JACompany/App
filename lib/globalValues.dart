library values.globals;

import 'package:app/storage.dart';

const int total_hours = 0;

// storing user tasks
final Storage tasks_storage = Storage("tasks");
final List<String> tasks = <String>[];
