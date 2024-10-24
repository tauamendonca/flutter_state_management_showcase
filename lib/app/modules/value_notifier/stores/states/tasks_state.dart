import 'package:project_todolist/app/core/models/task_model.dart';

class TasksState {
  const TasksState({
    required this.allTasks,
    required this.currentDateTasks,
    required this.filteredTasks,
    required this.taskStatus,
  });

  final List<TaskModel> allTasks;
  final List<TaskModel> currentDateTasks;
  final List<TaskModel> filteredTasks;
  final TaskStatus? taskStatus;

  factory TasksState.initialState() {
    return const TasksState(
      allTasks: [],
      currentDateTasks: [],
      filteredTasks: [],
      taskStatus: null,
    );
  }

  int _taskCounter(TaskStatus status) {
    final tasks = currentDateTasks.where((e) => e.status == status);
    return tasks.length;
  }

  int get openTasksCount => _taskCounter(TaskStatus.open);
  int get closedTasksCount => _taskCounter(TaskStatus.closed);
  int get archivedTasksCount => _taskCounter(TaskStatus.archived);

  TasksState copyWith({
    List<TaskModel>? allTasks,
    List<TaskModel>? currentDateTasks,
    List<TaskModel>? filteredTasks,
    TaskStatus? taskStatus,
  }) {
    return TasksState(
      allTasks: allTasks ?? this.allTasks,
      currentDateTasks: currentDateTasks ?? this.currentDateTasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      taskStatus: taskStatus,
    );
  }
}
