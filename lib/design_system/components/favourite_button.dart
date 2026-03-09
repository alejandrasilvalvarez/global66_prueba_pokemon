import 'package:flutter/material.dart' hide Colors;

import '../ui_constants/colors.dart';
import '../ui_constants/layout.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({required this.isFavorite, super.key});

  final bool isFavorite;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(UILayout.xsmall),

    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(UILayout.xsmall),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.bronze[500] : Colors.white,
          size: 20,
        ),
      ),
    ),
  );
}
