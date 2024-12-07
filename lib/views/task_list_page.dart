import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_database_helper.dart';
import 'add_task_page.dart';
import 'edit_task_page.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

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

  void _deleteTask(int taskId) async {
    await TaskDatabaseHelper.instance.deleteTask(taskId);
    _loadTasks(); // Refresh the task list after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: _tasks.isEmpty
          ? const Center(
        child: Text(
          'No tasks available. Add one!',
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return Dismissible(
            key: ValueKey(task.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) {
              _deleteTask(task.id!);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${task.title} deleted')),
              );
            },
            child: ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: Text(task.dueDate),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTaskPage(task: task),
                  ),
                ).then((_) => _loadTasks()); // Reload tasks after returning
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskPage(),
            ),
          ).then((_) => _loadTasks()); // Reload tasks after adding
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
