import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../ui_constants/layout.dart';

class PokemonCardShimmer extends StatelessWidget {
  const PokemonCardShimmer({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      height: 104,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(UILayout.medium),
      ),
      child: Row(
        children: <Widget>[
          // LEFT SIDE (text area)
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UILayout.medium,
                vertical: UILayout.mediumText,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _box(width: 40, height: 10),
                  const SizedBox(height: 8),
                  _box(width: 100, height: 16),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      _box(width: 50, height: 16),
                      const SizedBox(width: 8),
                      _box(width: 50, height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // RIGHT SIDE (image placeholder)
          const Expanded(
            flex: 2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(UILayout.medium),
                  bottomRight: Radius.circular(UILayout.medium),
                ),
                color: Colors.white,
              ),
              child: Center(
                child: CircleAvatar(radius: 28, backgroundColor: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _box({required double width, required double height}) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
    ),
  );
}
