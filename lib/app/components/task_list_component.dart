import 'package:flutter/material.dart';

import '../core/widgets/task_card_widget.dart';

class TaskListComponent extends StatelessWidget {
  const TaskListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 30,
      separatorBuilder: (_, index) => const SizedBox(height: 8),
      itemBuilder: (_, index) {
        return TaskCardWidget(
          isDone: index.isEven,
          title: 'Title $index',
          description: 'Description $index',
          initialDate: index == 2
              ? DateTime.now().subtract(const Duration(days: 1))
              : DateTime.now().add(Duration(days: index)),
          endDate: DateTime.now().add(Duration(minutes: index * 3)),
          onTap: () {},
        );
      },
    );
  }
}
