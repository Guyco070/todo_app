import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/task.dart';

class TodoProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => [..._tasks];

  TodoProvider() {
    getData();
  }

  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? toDo = prefs.getStringList("toDo");
    final List<String>? isDone = prefs.getStringList("isDone");

    if (toDo != null && isDone != null) {
      for (int i = 0; i < toDo.length; i++) {
        _tasks.add(Task(
          toDo: toDo[i],
          isDone: isDone[i] == "false" ? false : true,
        ));
      }
      notifyListeners();
    }
  }

  updateLocalData({bool withToDo = true, bool withIsDone = true}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (withIsDone) {
      prefs.setStringList("toDo", [for (Task t in tasks) t.toDo]);
    }
    if (withIsDone) {
      prefs
          .setStringList("isDone", [for (Task t in tasks) t.isDone.toString()]);
    }
  }

  addTask(String todo) {
    _tasks.add(Task(toDo: todo));
    notifyListeners();
    updateLocalData();
  }

  removeTask(Task todo) {
    _tasks.remove(todo);
    notifyListeners();
    updateLocalData();
  }

  updateIsDone(Task todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    updateLocalData(withToDo: false);
  }
}
