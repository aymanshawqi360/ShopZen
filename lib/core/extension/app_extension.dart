import 'package:flutter/material.dart';
import 'package:shopzen/l10n/app_localizations.dart';

extension DarkOrLight on BuildContext {
  Brightness get _brightnessTheme => Theme.of(this).brightness;

  bool isDark() => (_brightnessTheme == Brightness.dark);
  bool islight() => (_brightnessTheme == Brightness.light);
}


extension LocalizationExtension on BuildContext {
  //String t(String key) => AppLocalizations.of(this)!.translate(key);
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}