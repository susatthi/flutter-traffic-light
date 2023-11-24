import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_data.g.dart';

@riverpod
Color seedColor(SeedColorRef ref) {
  return Colors.green;
}

@riverpod
ThemeData themeData(ThemeDataRef ref) {
  final seedColor = ref.watch(seedColorProvider);
  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    brightness: Brightness.light,
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
  );
}
