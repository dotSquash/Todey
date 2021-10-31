import 'package:flutter/material.dart';
import 'package:todey_flutter/widgets/tasks_list.dart';
import 'package:todey_flutter/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todey_flutter/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen())),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.green,
                    size: 30.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} tasks',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
