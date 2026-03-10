part of com.global66.home.widgets;

class PokemonHeader extends StatelessWidget {
  const PokemonHeader({
    required this.pokemon,
    required this.config,
    required this.isFavorite,
    required this.onFavoriteTap,
    super.key,
  });

  final PokedexDetail pokemon;
  final PokemonTypeConfig config;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 307,
    child: Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        ClipPath(
          clipper: _HeaderClipper(),
          child: DecoratedBox(
            decoration: BoxDecoration(color: config.color),
            child: const SizedBox(
              width: double.infinity,
              height: UILayout.bannerHeaderHeight,
            ),
          ),
        ),
        // Background icon watermark
        Positioned(
          top: UILayout.mlarge,
          left: 0,
          right: 0,
          child: Center(
            child: ShaderMask(
              shaderCallback: (Rect bounds) => RadialGradient(
                center: Alignment.topCenter,
                radius: 0.8,
                colors: <Color>[
                  Colors.white.withAlpha(220),
                  Colors.white.withAlpha(40),
                ],
                stops: const <double>[0, 1],
              ).createShader(bounds),
              blendMode: BlendMode.srcIn,
              child: SvgPicture.asset(
                config.icon,
                height: UILayout.bannerTypeIconHeight,
              ),
            ),
          ),
        ),
        // AppBar Elements
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: UILayout.medium,
              vertical: UILayout.small,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  onPressed: () => context.pop(),
                ),
                FavouriteButton(isFavorite: isFavorite, onTap: onFavoriteTap),
              ],
            ),
          ),
        ),
        // Pokemon Image
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Image.network(
              pokemon.imageUrl,
              height: UILayout.xxxlarge,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    ),
  );
}

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height - 60)
      ..quadraticBezierTo(
        size.width / 2,
        size.height + 60,
        size.width,
        size.height - 60,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
