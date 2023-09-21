import 'package:flutter/material.dart';

class AppColor {
  const AppColor({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.lightColor,
    required this.darkColor,
    required this.surface,
    required this.warning,
    required this.error,
    required this.outline,
    required this.brightness,
  });

  final Color accent;
  final Brightness brightness;
  final Color darkColor;
  final Color error;
  final Color lightColor;
  final Color outline;
  final Color primary;
  final Color secondary;
  final Color surface;
  final Color warning;

  ColorScheme colorScheme() => ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        onPrimary: lightColor,
        primaryContainer: primary,
        onPrimaryContainer: lightColor,
        secondary: secondary,
        onSecondary: lightColor,
        secondaryContainer: secondary,
        onSecondaryContainer: lightColor,
        tertiary: accent,
        onTertiary: lightColor,
        background: lightColor,
        onBackground: darkColor,
        surface: surface,
        onSurface: darkColor,
        outline: outline,
        surfaceTint: accent.withOpacity(.1),
        error: error,
        onError: lightColor,
        errorContainer: warning,
        onErrorContainer: darkColor,
        brightness: brightness,
      );

  AppColor copyWith({
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? lightColor,
    Color? darkColor,
    Color? surface,
    Color? warning,
    Color? error,
    Color? outline,
    Brightness? brightness,
  }) {
    return AppColor(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      lightColor: lightColor ?? this.lightColor,
      darkColor: darkColor ?? this.darkColor,
      surface: surface ?? this.surface,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      outline: outline ?? this.outline,
      brightness: brightness ?? this.brightness,
    );
  }
}
