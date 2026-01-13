import 'package:flutter/material.dart';

extension DarkOrLight on BuildContext {
  Brightness get _brightnessTheme => Theme.of(this).brightness;

  bool isDark() => (_brightnessTheme == Brightness.dark);
  bool islight() => (_brightnessTheme == Brightness.light);
}
