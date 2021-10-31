import 'package:flutter/material.dart';
import 'package:todey_flutter/models/task_data.dart';
import 'screens/tasks_Screen.dart';
import 'package:provider/provider.dart';
import 'package:todey_flutter/models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return TaskData();
      },
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
