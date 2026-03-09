import 'package:flutter/material.dart' hide Colors;

import '../ui_constants/colors.dart';
import '../ui_constants/layout.dart';
import '../ui_constants/spacing.dart';

class ErrorIllustrationHome extends StatelessWidget {
  const ErrorIllustrationHome({
    required this.title,
    required this.subtitle,
    required this.illustration,
    super.key,
  });

  final String title;
  final String subtitle;
  final String illustration;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: UILayout.medium),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,

      children: <Widget>[
        Image.asset(illustration, fit: BoxFit.contain, width: 185),
        Spacing.spacingV16,
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.escalaDeCinza[800],
            fontWeight: FontWeight.w600,
            fontSize: UILayout.largeText,
          ),
        ),
        Spacing.spacingV16,
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.escalaDeCinza[700],
            fontSize: UILayout.mediumText,
          ),
        ),
      ],
    ),
  );
}
