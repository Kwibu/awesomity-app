import 'package:flutter/material.dart';
import 'task.dart';

class Tasks with ChangeNotifier {
  bool isToggled = false;
  final List<Task> _items = [];

  List<Task> get items {
    return [..._items];
  }

  // todo ADDING NEW TASK TO THE APP
  void addTask(Task task) {
    final newTask = Task(
        id: task.id,
        title: task.title,
        description: task.description,
        isFinish: task.isFinish,
        imageUrl: task.imageUrl,
        priority: task.priority,
        createdTime: task.createdTime,
        endedTime: task.endedTime);
    _items.insert(0, newTask);
    notifyListeners();
  }

  Task findById(var taskId) {
    return _items.firstWhere((task) => task.id == taskId);
  }

  // Task deleteById(var taskId) {
  //   return _items.removeWhere((task) => task.id == taskId);
  // }

  activeTasks() {
    return _items.where((element) => element.isFinish == false).length;
  }

  doneTasks() {
    return _items.where((element) => element.isFinish == true).length;
  }
}
