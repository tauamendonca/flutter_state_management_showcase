import 'package:flutter/material.dart';
import 'package:project_todolist/app/core/controllers/form_controller.dart';
import '../../../components/add_task_form_component.dart';

class AddTaskPageVn extends StatelessWidget {
  const AddTaskPageVn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: AddTaskForm(
            formController: FormController(),
          ),
        ));
  }
}
