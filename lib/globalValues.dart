library values.globals;

import 'package:app/storage.dart';

const int total_hours = 0;

// storing user tasks
Storage tasks_storage = Storage("tasks");
List<String> tasks = <String>[];
