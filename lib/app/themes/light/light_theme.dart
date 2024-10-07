import 'package:flutter/material.dart';
import 'package:project_todolist/app/themes/color_extension.dart';
import 'package:project_todolist/app/themes/light/light_colors.dart';

class LightTheme {
  static final theme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: LightColors.appBarBlack,
          fontSize: 20,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: const TextTheme(
        titleSmall: TextStyle(
          color: LightColors.gray,
        ),
        bodyMedium: TextStyle(
          color: LightColors.gray,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: LightColors.lightBlue,
          foregroundColor: LightColors.primaryBlue,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
      dividerColor: LightColors.gray,
      extensions: [
        ColorExtension(
          focusedBadgeColor: LightColors.darkBlue,
          unfocusedBadgeColor: LightColors.lightGray,
          doneBackgroundColor: LightColors.darkBlue,
          doneBorderColor: LightColors.lightGray,
        ),
      ]);
}
