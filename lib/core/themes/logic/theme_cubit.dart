import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  // Toggle between light and dark mode
  void toggleTheme() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }

  // Set specific theme mode
  void setTheme(final ThemeMode mode) {
    emit(mode);
  }

  // Persist state to storage
  @override
  ThemeMode? fromJson(final Map<String, dynamic> json) {
    final themeStr = json['theme'] as String?;
    switch (themeStr) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(final ThemeMode state) {
    String themeStr = 'system';
    if (state == ThemeMode.light) themeStr = 'light';
    if (state == ThemeMode.dark) themeStr = 'dark';
    return {'theme': themeStr};
  }
}
