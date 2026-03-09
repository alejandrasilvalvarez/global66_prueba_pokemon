import 'package:flutter/material.dart' hide Colors;

import '../ui_constants/colors.dart';
import '../ui_constants/layout.dart';

extension PokedexTextStyles on BuildContext {
  TextStyle get title => TextStyle(
    fontSize: UILayout.mlarge,
    fontWeight: FontWeight.bold,
    color: TextColors.textPrimary.color,
  );

  TextStyle get subtitle => TextStyle(
    fontSize: UILayout.medium,
    color: TextColors.textSecondary.color,
    fontWeight: FontWeight.w600,
  );

  TextStyle get body => TextStyle(
    fontSize: UILayout.mediumText,
    color: TextColors.textSecondary.color,
  );

  TextStyle get sectionTitle => TextStyle(
    fontSize: UILayout.largeText,
    fontWeight: FontWeight.bold,
    color: TextColors.textPrimary.color,
  );
}
