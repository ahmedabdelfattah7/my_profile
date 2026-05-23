import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeMode>((ref) {
      return ThemeController();
    });

class ThemeController extends StateNotifier<ThemeMode> {
  ThemeController() : super(_getInitialThemeMode());

  static ThemeMode _getInitialThemeMode() {
    final hour = DateTime.now().hour;
    // Consider night time to be between 6 PM (18:00) and 6 AM (6:00)
    if (hour >= 18 || hour < 6) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
