import 'package:flutter/material.dart';
import 'package:project_todolist/app/core/models/task_model.dart';
import 'package:project_todolist/app/modules/value_notifier/stores/tasks_vn_store.dart';

import '../core/widgets/filter_item_widget.dart';

class FilterListComponent extends StatelessWidget {
  const FilterListComponent({super.key, required this.tasksVnStore});

  final TasksVnStore tasksVnStore;

  void filterTasks(status) {
    return tasksVnStore.filterTasksByStatus(status);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: tasksVnStore,
        builder: (_, state, __) {
          return SizedBox(
            height: 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterItemWidget(
                  title: 'Todas',
                  isSelected: state.taskStatus == null,
                  notificationCount: state.currentDateTasks.length,
                  onTap: tasksVnStore.clearStatusFilter,
                ),
                const SizedBox(width: 6),
                const VerticalDivider(),
                FilterItemWidget(
                  title: 'Abertas',
                  isSelected: state.taskStatus == TaskStatus.open,
                  notificationCount: state.openTasksCount,
                  onTap: () {
                    print('TAPOU CARAIO');
                    filterTasks(TaskStatus.open);
                  },
                ),
                const SizedBox(width: 12),
                FilterItemWidget(
                    title: 'Fechadas',
                    isSelected: state.taskStatus == TaskStatus.closed,
                    notificationCount: state.closedTasksCount,
                    onTap: () {
                      print('TAPOU CARAIO');
                      filterTasks(TaskStatus.closed);
                    }),
                const SizedBox(width: 12),
                FilterItemWidget(
                  title: 'Arquivadas',
                  isSelected: state.taskStatus == TaskStatus.archived,
                  notificationCount: state.archivedTasksCount,
                  onTap: () => filterTasks(TaskStatus.archived),
                ),
              ],
            ),
          );
        });
  }
}
