import 'package:flutter/foundation.dart';
import 'package:todey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    /// this is a way at looking at a list, but you can't touch it or change it. It's not a listView widget
    /// it's a way to saftey check so that we can't tap into the list
    /// so that we add tasks using the provider way
    /// because when we add tasks, we have to do it with the provider way
    /// so this throws an error when we access this list from the outside and try to modify it, we can only read now.
    /// this prevents us from writing code that will not work.
    /// it increases the saftey
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
