import 'package:flutter/material.dart';
import 'package:project_todolist/app/core/shared/utils/app_formaters.dart';
import 'package:project_todolist/app/widgets/task_done_widget.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.isDone,
    required this.title,
    required this.description,
    required this.initialDate,
    required this.endDate,
    required this.onTap,
  });

  final bool isDone;
  final String title;
  final String description;
  final DateTime initialDate;
  final DateTime endDate;
  final VoidCallback onTap;

  TextDecoration get titleDecoration {
    if (isDone) {
      return TextDecoration.lineThrough;
    } else {
      return TextDecoration.none;
    }
  }

  String get initHour => AppFormaters.formatDate(initialDate);
  String get endHour => AppFormaters.formatDate(endDate);
  String get dayMessage {
    final message = AppFormaters.dayMessage(initialDate);

    return message ?? AppFormaters.onlyDay(initialDate);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        decoration: titleDecoration,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                TaskDoneWidget(isDone: isDone),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '$dayMessage    ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      )),
                  TextSpan(text: '$initHour - $endHour')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
