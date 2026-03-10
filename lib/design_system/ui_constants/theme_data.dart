import 'package:flutter/material.dart' hide Colors;
import 'colors.dart';
import 'layout.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppButtonState.buttonPrimary.color,
    ),
    elevatedButtonTheme: _buttonTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static final ElevatedButtonThemeData _buttonTheme = ElevatedButtonThemeData(
    style:
        ElevatedButton.styleFrom(
          backgroundColor: AppButtonState.buttonPrimary.color,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppButtonState.buttonPrimaryDisabled.color,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return AppButtonState.buttonPrimaryDisabled.color;
            }
            if (states.contains(WidgetState.pressed)) {
              return AppButtonState.buttonPrimaryPressed.color;
            }
            if (states.contains(WidgetState.hovered)) {
              return AppButtonState.buttonPrimaryHover.color;
            }
            return AppButtonState.buttonPrimary.color;
          }),
        ),
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: UILayout.small),
        hintStyle: TextStyle(
          color: TextColors.textDisabled.color,
          fontSize: UILayout.mediumText,
        ),
        prefixIconColor: IconColors.disabled.color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UILayout.xxlarge),
          borderSide: BorderSide(color: BorderColors.defaultColor.color),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UILayout.xxlarge),
          borderSide: BorderSide(color: BorderColors.defaultColor.color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UILayout.xxlarge),
          borderSide: BorderSide(
            color: BorderColors.defaultColor.color,
            width: 1.5,
          ),
        ),
      );
}
