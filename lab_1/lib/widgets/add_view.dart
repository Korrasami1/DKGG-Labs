import 'package:flutter/material.dart';
import 'package:lab_1/model/task_handler.dart';
import 'package:provider/provider.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});
  

  @override
  Widget build(BuildContext context) {

    var taskHandler = Provider.of<TaskHandler>(context, listen: false);
    String taskTitle = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          onChanged: (value) {
            taskTitle = value;
          },
          decoration: InputDecoration(
            labelText: 'What todo',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          taskHandler.addTask(taskTitle);
          Navigator.pop(context);
        },
        tooltip: 'Done',
        child: Icon(Icons.done),
        ),
    );
  }
}