import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_app_fire_base/models/task_model.dart';

class TaskService {
  // reference to the  firestore collection
  final CollectionReference _taskCollection = FirebaseFirestore.instance
      .collection("tasks");
  // method to add a new task to the Firestore collection
  Future<void> addTask(String name) async {
    try {
      // create a new task with the name and the current time
      final task = Task(
        id: "",
        name: name,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isUpdated: false,
      );
      //  convert a task from to a map
      final Map<String, dynamic> data = task.toJson();

      // add atask to the collection
      await _taskCollection.add(data);
      // ignore: avoid_print
      print("Task added");
    } catch (error) {
      // ignore: avoid_print
      print("error ading task$error");
    }
  }
}
