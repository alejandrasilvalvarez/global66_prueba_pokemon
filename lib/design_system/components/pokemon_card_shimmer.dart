import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../ui_constants/border_radius.dart';
import '../ui_constants/layout.dart';

class PokemonCardShimmer extends StatelessWidget {
  const PokemonCardShimmer({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(UILayout.medium),
      ),
      child: SizedBox(
        height: 104,
        child: Row(
          children: <Widget>[
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
                    const SizedBox(height: UILayout.small),
                    _box(width: 100, height: UILayout.medium),
                    const SizedBox(height: UILayout.small),
                    Row(
                      children: <Widget>[
                        _box(width: 50, height: UILayout.medium),
                        const SizedBox(width: UILayout.small),
                        _box(width: 50, height: UILayout.medium),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
                  child: CircleAvatar(
                    radius: UILayout.mlarge,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _box({required double width, required double height}) => DecoratedBox(
    decoration: BoxDecoration(color: Colors.white, borderRadius: radius8),
    child: SizedBox(width: width, height: height),
  );
}
