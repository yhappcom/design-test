import 'package:flutter/material.dart';

abstract final class PreviewColors {
  static const lightCanvas = Color(0xFFF7F8F8);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightText = Color(0xFF1B2224);
  static const lightSecondary = Color(0xFF596164);
  static const lightRule = Color(0xFFC9CED0);
  static const lightAction = Color(0xFF355F6B);
  static const lightOnAction = Color(0xFFFFFFFF);
  static const lightFocus = Color(0xFF654FB0);
  static const lightSelected = Color(0xFFE0EAED);

  static const darkCanvas = Color(0xFF14191B);
  static const darkSurface = Color(0xFF1A2022);
  static const darkText = Color(0xFFF0F3F4);
  static const darkSecondary = Color(0xFFBCC3C5);
  static const darkRule = Color(0xFF4B5558);
  static const darkAction = Color(0xFF9BC3CF);
  static const darkOnAction = Color(0xFF172226);
  static const darkFocus = Color(0xFFB8AAE5);
  static const darkSelected = Color(0xFF29373B);
}

abstract final class PreviewSpace {
  static const xxs = 4.0;
  static const xs = 8.0;
  static const sm = 12.0;
  static const md = 20.0;
  static const lg = 28.0;
  static const xl = 36.0;
}

class PreviewTheme {
  static ThemeData light({String fontFamily = 'Roboto'}) =>
      _build(Brightness.light, fontFamily);
  static ThemeData dark({String fontFamily = 'Roboto'}) =>
      _build(Brightness.dark, fontFamily);

  static ThemeData _build(Brightness brightness, String fontFamily) {
    final dark = brightness == Brightness.dark;
    final canvas = dark ? PreviewColors.darkCanvas : PreviewColors.lightCanvas;
    final text = dark ? PreviewColors.darkText : PreviewColors.lightText;
    final secondary =
        dark ? PreviewColors.darkSecondary : PreviewColors.lightSecondary;
    final action = dark ? PreviewColors.darkAction : PreviewColors.lightAction;
    final onAction =
        dark ? PreviewColors.darkOnAction : PreviewColors.lightOnAction;
    final rule = dark ? PreviewColors.darkRule : PreviewColors.lightRule;

    final scheme = ColorScheme(
      brightness: brightness,
      primary: action,
      onPrimary: onAction,
      secondary: secondary,
      onSecondary: canvas,
      error: dark ? const Color(0xFFDFA0A6) : const Color(0xFF934149),
      onError: canvas,
      surface: dark ? PreviewColors.darkSurface : PreviewColors.lightSurface,
      onSurface: text,
      outline: rule,
      outlineVariant: rule,
    );

    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: canvas,
      fontFamily: fontFamily,
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 20,
          height: 1.2,
          fontWeight: FontWeight.w700,
          color: text,
        ),
        titleMedium: TextStyle(
          fontSize: 17,
          height: 1.25,
          fontWeight: FontWeight.w600,
          color: text,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          height: 1.4,
          fontWeight: FontWeight.w400,
          color: text,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          height: 1.4,
          fontWeight: FontWeight.w400,
          color: text,
        ),
        labelLarge: TextStyle(
          fontSize: 15,
          height: 1.2,
          fontWeight: FontWeight.w600,
          color: text,
        ),
      ),
    );
  }
}

extension PreviewThemeX on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  Color get previewSecondary =>
      isDark ? PreviewColors.darkSecondary : PreviewColors.lightSecondary;
  Color get previewRule =>
      isDark ? PreviewColors.darkRule : PreviewColors.lightRule;
  Color get previewAction =>
      isDark ? PreviewColors.darkAction : PreviewColors.lightAction;
  Color get previewOnAction =>
      isDark ? PreviewColors.darkOnAction : PreviewColors.lightOnAction;
  Color get previewFocus =>
      isDark ? PreviewColors.darkFocus : PreviewColors.lightFocus;
  Color get previewSelected =>
      isDark ? PreviewColors.darkSelected : PreviewColors.lightSelected;
}
