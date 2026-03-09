import 'package:flutter/material.dart' hide Colors;
import 'colors.dart'; 

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppButtonState.buttonPrimary.color,
    ),
    elevatedButtonTheme: _buttonTheme,
  );

  static final ElevatedButtonThemeData _buttonTheme = ElevatedButtonThemeData(
    style:
        ElevatedButton.styleFrom(
          backgroundColor: AppButtonState.buttonPrimary.color,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppButtonState.buttonPrimaryDisabled.color,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
}
