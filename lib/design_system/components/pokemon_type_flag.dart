import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_svg/svg.dart';

import '../ui_constants/colors.dart';
import '../ui_constants/layout.dart';
import '../ui_constants/spacing.dart';

class PokemonTypeFlag extends StatelessWidget {
  const PokemonTypeFlag({
    required this.iconPath,
    required this.label,
    required this.typeColor,
    super.key,
  });

  final String iconPath;
  final String label;
  final Color typeColor;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: typeColor,
      borderRadius: BorderRadius.circular(UILayout.xxxlarge),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UILayout.xsmall,
        vertical: UILayout.xxsmall,
      ),
      child: Row(
        children: <Widget>[
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(UILayout.xxsmall),
              child: SvgPicture.asset(
                iconPath,
                width: UILayout.smallText,
                height: UILayout.smallText,
                colorFilter: ColorFilter.mode(typeColor, BlendMode.srcIn),
              ),
            ),
          ),
          Spacing.spacingH4,
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: UILayout.smallText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
