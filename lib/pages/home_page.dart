import 'package:flutter/material.dart';
import 'package:task_app_fire_base/service/task_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _taskControler = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _taskControler.dispose();
  }

  // show diolog box
  void _showAddTaskDiolog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Task"),
          content: TextField(
            controller: _taskControler,
            decoration: const InputDecoration(
              hintText: "enter a task name",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            // cancel button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await TaskService().addTask(_taskControler.text);
                _taskControler.clear();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
              child: Text("save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDiolog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
