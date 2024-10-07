import 'package:flutter/material.dart';
import 'package:project_todolist/app/core/controllers/form_controller.dart';
import 'package:project_todolist/app/core/utils/app_pickers.dart';
import '../core/widgets/text_field_widget.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({
    super.key,
    required this.formController,
  });

  final FormController formController;

  Future<void> datePicker(BuildContext context) async {
    final date = await AppPickers.appDatePicker(context);

    if (date == null) return;

    formController.changeDate(date);
  }

  Future<void> initHourPicker(BuildContext context) async {
    final initHour = await AppPickers.appTimePicker(context);

    if (initHour == null) return;

    formController.changeInitHour(initHour);
  }

  Future<void> endHourPicker(BuildContext context) async {
    final endHour = await AppPickers.appTimePicker(context);

    if (endHour == null) return;

    formController.changeEndHour(endHour);
  }

  String? defaulValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formController.formKey,
      child: Column(
        children: [
          TextFieldWidget(
            controller: formController.titleController,
            label: 'Título',
            validator: defaulValidator,
          ),
          const SizedBox(height: 28),
          TextFieldWidget(
            controller: formController.descriptionController,
            label: 'Descrição',
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            validator: defaulValidator,
          ),
          TextFieldWidget(
            controller: formController.dateController,
            label: 'Data',
            readOnly: true,
            onTap: () => datePicker(context),
            validator: defaulValidator,
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  controller: formController.initHourController,
                  label: 'Hora Inicial',
                  readOnly: true,
                  onTap: () => initHourPicker(context),
                  validator: defaulValidator,
                ),
              ),
              const SizedBox(width: 28),
              Expanded(
                child: TextFieldWidget(
                  controller: formController.endHourController,
                  label: 'Hora Final',
                  readOnly: true,
                  onTap: () => endHourPicker(context),
                  validator: defaulValidator,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          ElevatedButton(
            onPressed: formController.add,
            child: const Text('Adicionar Tarefa'),
          ),
        ],
      ),
    );
  }
}
