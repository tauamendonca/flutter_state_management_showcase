import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_todolist/app/components/filter_list_component.dart';
import 'package:project_todolist/app/components/task_list_component.dart';
import 'package:project_todolist/app/core/utils/app_formaters.dart';
import 'package:project_todolist/app/core/widgets/header_widget.dart';

import '../../../core/widgets/home_app_bar_widget.dart';

class TaskPageVn extends StatefulWidget {
  const TaskPageVn({super.key});

  @override
  State<TaskPageVn> createState() => _HomePageState();
}

class _HomePageState extends State<TaskPageVn> {
  void navigateToForm() {
    Modular.to.pushNamed('add');
  }

  // Exemple Native Navigation
  // void navigateToForm() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return const AddTaskPageVn();
  //       },
  //     ),
  //   );
  // }

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
