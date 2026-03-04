import 'package:flutter/material.dart';
import 'package:lab_1/model/task_handler.dart';
import 'package:lab_1/model/types.dart';
import 'package:lab_1/widgets/add_view.dart';
import 'package:lab_1/widgets/tasklist.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Things todo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: _actions(context),
      ),
      body: Tasklist(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddView()),
          );
        },
        tooltip: 'Add todo',
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Widget> _actions(context) {
    return [_filterMenu(context)];
  }

  Widget _filterMenu(context) {
    var taskHandler = Provider.of<TaskHandler>(context, listen: false);

    return PopupMenuButton<FilterType>(
      initialValue: taskHandler.mode,
      onSelected: (FilterType item) {
        taskHandler.setMode(item);
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<FilterType>(
          value: FilterType.all,
          child: Text('All'),
        ),
        const PopupMenuItem<FilterType>(
          value: FilterType.done,
          child: Text('Done'),
        ),
        const PopupMenuItem<FilterType>(
          value: FilterType.undone,
          child: Text('Undone'),
        ),
      ],
    );
  }
}
