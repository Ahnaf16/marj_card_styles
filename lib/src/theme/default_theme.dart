import 'package:flutter/material.dart';
import 'package:marj_card_styles/src/theme/theme.dart';

class Palette {
  const Palette._();

  // Colors
  static const AppColor defColors = AppColor(
    primary: Color(0xFF3562CC),
    secondary: Color(0xFF5675BD),
    accent: Color(0xFF384666),
    lightColor: Colors.white,
    darkColor: Color(0xFF1B1E24),
    surface: Color(0xFFF4FCFF),
    warning: Color(0xFFFFD519),
    error: Color(0xFF830900),
    outline: Color(0xFF9296A3),
    brightness: Brightness.light,
  );

  static BoxShadow defaultBoxShadow = BoxShadow(
    blurRadius: 8,
    offset: const Offset(3, 3),
    color: defColors.accent,
  );

  static ThemeData defTheme = _theme(null);
  static ThemeData theme(AppColor? appColor) => _theme(appColor);

  static ThemeData _theme(AppColor? appColor) {
    final color = appColor ?? defColors;
    return ThemeData(
      useMaterial3: true,
      primaryColor: color.primary,
      scaffoldBackgroundColor: color.lightColor,
      brightness: Brightness.light,
      colorScheme: color.colorScheme(),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: color.outline),
      dividerTheme: DividerThemeData(color: color.outline),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(color.lightColor),
        ),
      ),
      splashColor: color.accent.withOpacity(.5),
    );
  }
}
