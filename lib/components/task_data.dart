import 'package:flutter/material.dart';
import 'package:todo/components/task_item.dart';

class TaskData extends ChangeNotifier {
  List<TaskItem> taskList = [];

  void addTask(String newTaskText) {
    taskList.add(TaskItem(taskText: newTaskText));
    notifyListeners();
  }

  void addAt(String taskText, int index) {
    taskList.removeAt(index);
    taskList.insert(index, TaskItem(taskText: taskText));
    notifyListeners();
  }

  void deleteTask(TaskItem task) {
    taskList.remove(task);
    notifyListeners();
  }

  void moveTaskUp(TaskItem task) {
    final taskIndex = taskList.indexOf(task);
    if (taskIndex > 0) {
      taskList.insert(taskIndex - 1, taskList.removeAt(taskIndex));
      notifyListeners();
    }
  }

  void moveTaskDown(TaskItem task) {
    final taskIndex = taskList.indexOf(task);
    if (taskIndex < taskList.length - 1) {
      taskList.insert(taskIndex + 1, taskList.removeAt(taskIndex));
      notifyListeners();
    }
    notifyListeners();
  }
}
