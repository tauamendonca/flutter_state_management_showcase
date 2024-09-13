import 'package:flutter/material.dart';
import 'package:project_todolist/app/components/filter_list_component.dart';
import 'package:project_todolist/app/components/task_list_component.dart';
import 'package:project_todolist/app/widgets/header_widget.dart';

import '../widgets/home_app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: HomeAppBarWidget(
        title: Text(
          'Hoje',
          style: theme.appBarTheme.titleTextStyle,
        ),
        onTitleTap: (date) {},
        onNextTap: () {},
        onPreviousTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: Column(
          children: [
            HeaderWidget(
              onAddTap: () {},
              title: 'Tarefas de Hoje',
              subtitle:
                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            ),
            const SizedBox(height: 20),
            const FilterListComponent(),
            const SizedBox(height: 20),
            const Expanded(child: TaskListComponent()),
          ],
        ),
      ),
    );
  }
}
