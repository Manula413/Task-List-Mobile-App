import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_database_helper.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key}); // Ensure a proper constructor

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    var tasks = await TaskDatabaseHelper.instance.getTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Text(task.dueDate),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskPage(), // Ensure proper navigation
            ),
          ).then((_) => _loadTasks()); // Reload tasks after returning from AddTaskPage

           */
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
