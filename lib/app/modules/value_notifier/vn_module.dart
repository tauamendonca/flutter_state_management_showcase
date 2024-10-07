import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_todolist/app/modules/value_notifier/pages/add_task_page_vn.dart';
import 'package:project_todolist/app/modules/value_notifier/pages/task_page_vn.dart';

class ValueNotifierModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const TaskPageVn()),
    ChildRoute('/add', child: (_, __) => const AddTaskPageVn()),
  ];
}
