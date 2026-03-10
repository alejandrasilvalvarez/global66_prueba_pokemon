import 'package:flutter/material.dart' hide Colors;

import '../ui_constants/colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({required this.label, this.onPressed, super.key});
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style:
          ElevatedButton.styleFrom(
            backgroundColor: AppButtonState.buttonSecondary.color,
            foregroundColor: Colors.white,
            disabledBackgroundColor:
                AppButtonState.buttonSecondaryDisabled.color,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith<Color?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return AppButtonState.buttonSecondaryDisabled.color;
              }
              if (states.contains(WidgetState.pressed)) {
                return AppButtonState.buttonSecondaryPressed.color;
              }
              if (states.contains(WidgetState.hovered)) {
                return AppButtonState.buttonSecondaryHover.color;
              }
              return AppButtonState.buttonSecondary.color;
            }),
          ),
      child: Text(
        label,
        style: TextStyle(
          color: TextColors.textPrimary.color,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
