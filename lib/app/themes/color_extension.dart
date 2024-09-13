import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  ColorExtension({
    required this.focusedBadgeColor,
    required this.unfocusedBadgeColor,
    required this.doneBackgroundColor,
    required this.doneBorderColor,
  });

  final Color focusedBadgeColor;
  final Color unfocusedBadgeColor;
  final Color doneBackgroundColor;
  final Color doneBorderColor;

  @override
  ThemeExtension<ColorExtension> lerp(
    covariant ThemeExtension<ColorExtension>? other,
    double t,
  ) {
    if (other == null || t < 0.5) return this;
    return other;
  }

  @override
  ColorExtension copyWith({
    Color? focusedBadgeColor,
    Color? unfocusedBadgeColor,
    Color? doneBackgroundColor,
    Color? doneBorderColor,
  }) {
    return ColorExtension(
      focusedBadgeColor: focusedBadgeColor ?? this.focusedBadgeColor,
      unfocusedBadgeColor: unfocusedBadgeColor ?? this.unfocusedBadgeColor,
      doneBackgroundColor: doneBackgroundColor ?? this.doneBackgroundColor,
      doneBorderColor: doneBorderColor ?? this.doneBorderColor,
    );
  }
}
