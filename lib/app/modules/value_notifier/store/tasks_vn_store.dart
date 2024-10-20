import 'package:flutter/material.dart';
import 'package:project_todolist/app/core/models/task_model.dart';

class TasksVnStore extends ValueNotifier<List<TaskModel>> {
  TasksVnStore() : super([]);

  Future<void> getTasks(DateTime date) async {
    final tasks = List.generate(5, (index) {
      return TaskModel(
        id: index,
        title: 'Title $index',
        description: 'Description $index',
        initialDate: date,
        endDate: date.add(Duration(minutes: index * 5)),
        isDone: index.isEven,
        status: TaskStatus.values[index % 3],
      );
    });

    value = tasks;
  }
}
