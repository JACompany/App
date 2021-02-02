import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

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

  void write(List data) async {
    final file = await localFile;
    String toWrite = "";
    for (int i = 0; i < data.length; i++) {
      toWrite += data.elementAt(i).toString();
    }
    file.writeAsString(toWrite);
  }
}
