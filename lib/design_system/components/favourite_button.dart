import 'package:flutter/material.dart' hide Colors;

import '../ui_constants/colors.dart';
import '../ui_constants/layout.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    required this.isFavorite,
    required this.onTap,
    super.key,
  });

  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(UILayout.xxsmall),

    child: SizedBox(
      height: UILayout.mlarge,
      width: UILayout.mlarge,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: UILayout.xxsmall),
        ),
        child: IconButton(
          iconSize: UILayout.medium,

          onPressed: onTap,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.bronze[500] : Colors.white,
            size: UILayout.medium,
          ),
        ),
      ),
    ),
  );
}
