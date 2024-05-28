import 'package:flutter/material.dart';
import 'package:ToDoo/app/model/task.dart';
import 'package:ToDoo/app/repository/task_repository.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _taskList = [];
  final TaskRepository _taskRepository = TaskRepository();

  Future<void> getTasks() async {
    _taskList = await _taskRepository.getTasks();
    notifyListeners();
  }

  List<Task> get taskList => _taskList;

  void onTaskDoneChange(Task task){
    task.done = !task.done;
    _taskRepository.saveTasks(_taskList);
    notifyListeners();
  }

  void addNewTask(Task task) {
    _taskRepository.addTask(task);
    getTasks();
  }

}
