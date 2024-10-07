import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppFormaters {
  static String formatHourFromTime(TimeOfDay time) {
    final date = DateTime.now().copyWith(hour: time.hour, minute: time.minute);

    final formattedTime = DateFormat('H:m', 'pt_BR').format(date);

    return formattedTime;
  }

  static String formatTime(TimeOfDay time) {
    final hours = DateTime.now().copyWith(hour: time.hour, minute: time.minute);

    final formattedTime = DateFormat('H:m', 'pt_BR').format(hours);

    return formattedTime;
  }

  static String formatDate(DateTime date) {
    final formattedDate = DateFormat('H:m', 'pt_BR').format(date);

    return formattedDate;
  }

  static String? dayMessage(DateTime date) {
    final handledValue = _resetHour(date);
    final today = _resetHour(DateTime.now());
    final tomorrow = _resetHour(DateTime.now().add(const Duration(days: 1)));
    final yesterday =
        _resetHour(DateTime.now().subtract(const Duration(days: 1)));

    if (handledValue.isAtSameMomentAs(today)) {
      return 'Hoje';
    }

    if (handledValue.isAtSameMomentAs(tomorrow)) {
      return 'Amanhã';
    }

    if (handledValue.isAtSameMomentAs(yesterday)) {
      return 'Ontem';
    }

    return null;
  }

  static String onlyDay(DateTime date) =>
      DateFormat("d 'de' MMMM", 'pt_BR').format(date).toString();

  static String fullDate(DateTime date) =>
      DateFormat("EEEE, d 'de' MMMM", 'pt_BR').format(date).toString();

  static DateTime _resetHour(DateTime date) {
    return date.copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
  }
}
