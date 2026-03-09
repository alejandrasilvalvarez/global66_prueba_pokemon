import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../illustrations/assets_icons.dart';
import '../ui_constants/layout.dart';

class PokeBolaLoader extends StatefulWidget {
  const PokeBolaLoader({super.key, this.size = UILayout.xxxlarge});

  final double size;

  @override
  State<PokeBolaLoader> createState() => _PokeBolaLoaderState();
}

class _PokeBolaLoaderState extends State<PokeBolaLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.5, curve: Curves.easeIn),
    );

    _controller
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _fadeAnimation,
    child: RotationTransition(
      turns: _controller,
      child: SvgPicture.asset(
        AssetsConstants.loaderSplash,
        width: widget.size,
        height: widget.size,
      ),
    ),
  );
}
