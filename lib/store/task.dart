import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  late final String id;
  final String title;
  final String description;
  final String priority;
  final File? imageUrl;
  final DateTime createdTime;
  final DateTime endedTime;
  bool isFinish;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.isFinish,
      required this.imageUrl,
      required this.priority,
      required this.createdTime,
      required this.endedTime});

  void toggleIsDoneStatus() {
    isFinish = !isFinish;
    notifyListeners();
  }
}
