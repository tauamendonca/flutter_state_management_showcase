import 'package:project_todolist/app/core/models/task_model.dart';

class TasksState {
  const TasksState({
    required this.allTasks,
    required this.currentDateTasks,
    required this.shownTasks,
    required this.taskStatus,
  });

  final List<TaskModel> allTasks;
  final List<TaskModel> currentDateTasks;
  final List<TaskModel> shownTasks;
  final TaskStatus? taskStatus;

  factory TasksState.initialState() {
    return const TasksState(
      allTasks: [],
      currentDateTasks: [],
      shownTasks: [],
      taskStatus: null,
    );
  }

  TasksState copyWith({
    List<TaskModel>? allTasks,
    List<TaskModel>? currentDateTasks,
    List<TaskModel>? shownTasks,
    TaskStatus? taskStatus,
  }) {
    return TasksState(
      allTasks: allTasks ?? this.allTasks,
      currentDateTasks: currentDateTasks ?? this.currentDateTasks,
      shownTasks: shownTasks ?? this.shownTasks,
      taskStatus: taskStatus ?? this.taskStatus,
    );
  }
}
