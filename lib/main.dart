import 'package:flutter/material.dart';
import 'views/task_list_page.dart'; // Correct import path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TaskListPage(), // Ensure the home is set to TaskListPage
      routes: {
        '/taskList': (context) => const TaskListPage(),
      },
    );
  }
}
