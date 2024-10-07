import 'package:flutter/material.dart';
import 'package:project_todolist/app/components/filter_list_component.dart';
import 'package:project_todolist/app/components/task_list_component.dart';
import 'package:project_todolist/app/core/shared/utils/app_formaters.dart';
import 'package:project_todolist/app/modules/value_notifier/pages/add_task_page_vn.dart';
import 'package:project_todolist/app/widgets/header_widget.dart';

import '../../../widgets/home_app_bar_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _HomePageState();
}

class _HomePageState extends State<TaskPage> {
  void navigateToForm() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const AddTaskPage();
        },
      ),
    );
  }

  String get headerTitle {
    final dayMessage = AppFormaters.dayMessage(DateTime.now());

    if (dayMessage != null) {
      return 'Tarefas de $dayMessage';
    }

    return 'Tarefas';
  }

  String get headerSubtitle {
    return AppFormaters.fullDate(DateTime.now());
  }

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
              onAddTap: navigateToForm,
              title: headerTitle,
              subtitle: headerSubtitle,
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
