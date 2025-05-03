import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  bool isUpdated;

  Task({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.isUpdated,
  });

  // Factory constructor to create a Todo from a Firestore document
  factory Task.fromJson(Map<String, dynamic> doc, String id) {
    return Task(
      id: id,
      name: doc['name'],
      createdAt: (doc['createdAt'] as Timestamp).toDate(),
      updatedAt: (doc['updatedAt'] as Timestamp).toDate(),
      isUpdated: doc['isUpdated'],
    );
  }

  // Convert a Todo to a map to save to Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isUpdated': isUpdated,
    };
  }
}
