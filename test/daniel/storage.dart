import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Storage {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/counter.txt');
  }

  Future<String> read() async {
    try {
      final file = await localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (exception) {
      return null;
    }
  }

  Future<File> write(String data) async {
    final file = await localFile;
    return file.writeAsString(data);
  }
}
