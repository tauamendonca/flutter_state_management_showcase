import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_todolist/app/core/models/task_model.dart';
import 'package:project_todolist/app/core/utils/app_formaters.dart';
import 'package:project_todolist/app/modules/value_notifier/stores/states/tasks_state.dart';

class TasksVnStore extends ValueNotifier<TasksState> {
  TasksVnStore() : super(TasksState.initialState());

  Future<void> getTasks(DateTime date) async {
    final random = Random();

    final tasks = List.generate(50, (index) {
      final initialDate =
          DateTime.now().add(Duration(days: random.nextInt(25)));
      return TaskModel(
        id: index,
        title: 'Title $index',
        description: 'Description $index',
        initialDate: initialDate,
        endDate: initialDate.add(Duration(minutes: index * 2)),
        isDone: index.isEven,
        status: TaskStatus.values[index % 3],
      );
    });

    value = value.copyWith(allTasks: tasks);
    filterTasksByDate(date);
  }

  void filterTasksByDate(DateTime date) {
    final tasks = value.allTasks;

    final dateToFilter = AppFormaters.resetHour(date);

    final newCurrentTasks = tasks.where((e) {
      final initial = AppFormaters.resetHour(e.initialDate);
      return initial.isAtSameMomentAs(dateToFilter);
    }).toList();

    value = value.copyWith(
        currentDateTasks: newCurrentTasks, shownTasks: newCurrentTasks);
  }
}
