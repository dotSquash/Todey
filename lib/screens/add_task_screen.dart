import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  String? newTaskTitle = 'placeholder value';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // SizedBox(
              //   height: 10.0,
              // ),
              Center(
                child: Text(
                  'Add Task',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // SizedBox(height: 20.0),
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                cursorColor: Colors.lightBlueAccent,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              SizedBox(height: 10.0),
              FlatButton(
                  height: 80.0,
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle!);
                    Navigator.pop(context);
                    // add task button pressed
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
