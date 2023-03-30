import 'package:flutter/material.dart';
import 'package:my_to_do/Models/task_model.dart';

class TodoModel extends ChangeNotifier {
  List<TaskModel> taskList = []; //contians all the task

  addTaskInList(String title) {
    TaskModel taskModel = TaskModel(title);
    taskList.add(taskModel);
    notifyListeners();
  }
}
