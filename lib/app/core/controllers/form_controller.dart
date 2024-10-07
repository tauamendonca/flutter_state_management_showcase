import 'package:flutter/material.dart';
import 'package:project_todolist/app/core/utils/app_formaters.dart';

class FormController {
  FormController() {
    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    dateController = TextEditingController();
    initHourController = TextEditingController();
    endHourController = TextEditingController();
  }

  late final GlobalKey<FormState> formKey;
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController dateController;
  late final TextEditingController initHourController;
  late final TextEditingController endHourController;

  Future<void> add() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) return;

    debugPrint('add');
  }

  void changeDate(DateTime newDate) {
    final formattedDate = AppFormaters.fullDate(newDate);
    dateController.text = formattedDate;
  }

  void changeInitHour(TimeOfDay newInitHour) {
    final value = AppFormaters.formatHourFromTime(newInitHour);
    initHourController.text = value;
  }

  void changeEndHour(TimeOfDay newEndHour) {
    final value = AppFormaters.formatHourFromTime(newEndHour);
    endHourController.text = value;
  }
}
