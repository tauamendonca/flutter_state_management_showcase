import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_todolist/app/modules/value_notifier/pages/add_task_page_vn.dart';
import 'package:project_todolist/app/modules/value_notifier/pages/task_page_vn.dart';
import 'package:project_todolist/app/modules/value_notifier/store/date_vn_store.dart';

class ValueNotifierModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => DateVnStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => TaskPageVn(
        dateVnStore: Modular.get<DateVnStore>(),
      ),
    ),
    ChildRoute('/add', child: (_, __) => const AddTaskPageVn()),
  ];
}
