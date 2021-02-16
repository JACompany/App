import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'globalValues.dart' as values;

class Storage {
  String location;
  Storage(String location) {
    this.location = location;
  }
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/' + location + '.txt');
  }

  Future<List<String>> read(String splitter) async {
    try {
      final file = await localFile;
      String contents = await file.readAsString();
      return contents.split(splitter);
    } catch (exception) {
      return null;
    }
  }

  void write_all_values() async {
    final file = await localFile;
    String str = "";
    str += values.total_hours.toString() + ";";
    str += values.user_goal.toString() + ";";
    str += values.user_hours_day.toString() + ";";
    str += values.userID + ";";
    str += values.notificationID.toString() + ";";
    str += values.is_intial_setup.toString();
    file.writeAsString(str);
  }

  void write_past_hours() async {
    String str = "";
    final file = await localFile;
    for (int i = 0; i < values.past_hours.length; i++) {
      if (i != values.past_hours.length - 1)
        str += values.past_hours[i].toString() + ",";
      else
        str += values.past_hours[i].toString();
    }
    file.writeAsString(str);
  }

  void write(List data) async {
    final file = await localFile;
    String toWrite = "";
    for (int i = 0; i < data.length; i++) {
      toWrite += data.elementAt(i).toString();
    }
    file.writeAsString(toWrite);
  }
}
