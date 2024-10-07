import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_todolist/app/modules/home/home_module.dart';
import 'package:project_todolist/app/modules/value_notifier/vn_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/vn', module: ValueNotifierModule()),
  ];
}
