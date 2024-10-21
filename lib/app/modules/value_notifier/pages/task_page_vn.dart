import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_todolist/app/components/filter_list_component.dart';
import 'package:project_todolist/app/components/task_list_component.dart';
import 'package:project_todolist/app/core/utils/app_formaters.dart';
import 'package:project_todolist/app/core/utils/string_extension.dart';
import 'package:project_todolist/app/core/widgets/header_widget.dart';
import 'package:project_todolist/app/modules/value_notifier/stores/date_vn_store.dart';
import 'package:project_todolist/app/modules/value_notifier/stores/tasks_vn_store.dart';
import '../../../core/widgets/home_app_bar_widget.dart';

class TaskPageVn extends StatefulWidget {
  const TaskPageVn({
    super.key,
    required this.dateVnStore,
    required this.tasksVnStore,
  });

  final DateVnStore dateVnStore;
  final TasksVnStore tasksVnStore;

  @override
  State<TaskPageVn> createState() => _TaskPageVnState();
}

class _TaskPageVnState extends State<TaskPageVn> {
  DateVnStore get dateStore => widget.dateVnStore;
  TasksVnStore get tasksStore => widget.tasksVnStore;

  String get headerTitle {
    final dayMessage = AppFormaters.dayMessage(dateStore.value);

    if (dayMessage != null) return 'Tarefas de $dayMessage';

    return 'Tarefas';
  }

  String get headerSubtitle {
    return AppFormaters.fullDate(dateStore.value);
  }

  @override
  void initState() {
    super.initState();

    tasksStore.getTasks(dateStore.value);
    dateStore.addListener(reloadTasksOnDateChange);
  }

  void reloadTasksOnDateChange() {
    tasksStore.filterTasksByDate(dateStore.value);
  }

  void navigateToForm() {
    Modular.to.pushNamed('add');
  }

  @override
  void dispose() {
    dateStore.removeListener(reloadTasksOnDateChange);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: HomeAppBarWidget(
        onTitleTap: dateStore.changeDate,
        onNextTap: dateStore.nextDate,
        onPreviousTap: dateStore.previousDate,
        title: ValueListenableBuilder(
          valueListenable: dateStore,
          builder: (_, date, __) {
            return Text(
              AppFormaters.fullDate(date).capitalize(),
              style: theme.appBarTheme.titleTextStyle,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: dateStore,
                builder: (_, date, __) {
                  return HeaderWidget(
                    onAddTap: navigateToForm,
                    title: headerTitle,
                    subtitle: headerSubtitle,
                  );
                }),
            const SizedBox(height: 20),
            const FilterListComponent(),
            const SizedBox(height: 20),
            Expanded(
                child: TaskListComponent(
              tasksVnStore: tasksStore,
            )),
          ],
        ),
      ),
    );
  }
}

  // >> Native Navigation (if/when I remove Modular) <<
  // void navigateToForm() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return const AddTaskPageVn();
  //       },
  //     ),
  //   );
  // }