part of com.global66.home.widgets;

class PokedexDetailContent extends ConsumerWidget {
  const PokedexDetailContent({required this.pokemon, super.key});
  final PokedexDetail pokemon;

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1).toLowerCase();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String mainType = pokemon.types.isNotEmpty ? pokemon.types.first : 'normal';
    PokemonTypeConfig config = PokemonTypeHelper.getConfig(mainType);

    bool isFavorite = ref.watch(
      favouritesProvider.select(
        (Set<int> favorites) => favorites.contains(pokemon.id),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Header layer
        SizedBox(
          height: 307,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              ClipPath(
                clipper: _HeaderClipper(),
                child: Container(
                  width: double.infinity,
                  height: UILayout.bannerHeaderHeight,
                  color: config.primaryColor,
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
                      config.iconPath,
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
                      FavouriteButton(
                        isFavorite: isFavorite,
                        onTap: () {
                          ref
                              .read(favouritesProvider.notifier)
                              .toggleFavorite(pokemon.id);
                        },
                      ),
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
        ),

        // Content
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: UILayout.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _capitalize(pokemon.name),
                    style: TextStyle(
                      fontSize: UILayout.mlarge,
                      fontWeight: FontWeight.bold,
                      color: TextColors.textPrimary.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'N°${pokemon.id.toString().padLeft(3, '0')}',
                    style: TextStyle(
                      fontSize: UILayout.medium,
                      color: TextColors.textSecondary.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacing.spacingV24,

                  // Types Wrapper
                  Row(
                    spacing: 8,
                    children: pokemon.types.map((String type) {
                      PokemonTypeConfig tConfig = PokemonTypeHelper.getConfig(
                        type,
                      );
                      return PokemonTypeFlag(
                        iconPath: tConfig.iconPath,
                        label: _capitalize(type),
                        typeColor: tConfig.primaryColor,
                      );
                    }).toList(),
                  ),
                  Spacing.spacingV24,

                  // Description
                  Text(
                    pokemon.description,
                    style: TextStyle(
                      fontSize: UILayout.mediumText,
                      color: TextColors.textSecondary.color,
                    ),
                  ),
                  Spacing.spacingV24,
                  const Divider(
                    height: 1,
                    color: Colors.borderDefault,
                    thickness: 1,
                  ),
                  Spacing.spacingV24,

                  // Grid of stats
                  Row(
                    children: <Widget>[
                      _PokemonStatCard(
                        icon: Icons.shopping_bag_outlined,
                        label: 'PESO',
                        value: '${pokemon.weight} kg',
                      ),
                      const SizedBox(width: 16),
                      _PokemonStatCard(
                        icon: Icons.height,
                        label: 'ALTURA',
                        value: '${pokemon.height} m',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      _PokemonStatCard(
                        icon: Icons.grid_view_outlined,
                        label: 'CATEGORÍA',
                        value: _capitalize(pokemon.category),
                      ),
                      const SizedBox(width: 16),
                      _PokemonStatCard(
                        icon: Icons.catching_pokemon,
                        label: 'HABILIDAD',
                        value: _capitalize(pokemon.ability),
                      ),
                    ],
                  ),
                  Spacing.spacingV32,

                  // Genero
                  _GenderRatio(
                    maleRatio: pokemon.malePercentage,
                    femaleRatio: pokemon.femalePercentage,
                  ),
                  Spacing.spacingV32,

                  // Debilidades
                  Text(
                    'Debilidades',
                    style: TextStyle(
                      fontSize: UILayout.largeText,
                      fontWeight: FontWeight.bold,
                      color: TextColors.textPrimary.color,
                    ),
                  ),
                  Spacing.spacingV16,
                  Row(
                    spacing: 8,
                    children: pokemon.weaknesses.map((String type) {
                      PokemonTypeConfig tConfig = PokemonTypeHelper.getConfig(
                        type,
                      );
                      return PokemonTypeFlag(
                        iconPath: tConfig.iconPath,
                        label: _capitalize(type),
                        typeColor: tConfig.primaryColor,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: UILayout.xxlarge),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
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

class _PokemonStatCard extends StatelessWidget {
  const _PokemonStatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              size: UILayout.smallText,
              color: TextColors.textSecondary.color,
            ),
            Spacing.spacingH4,
            Text(
              label,
              style: TextStyle(
                fontSize: UILayout.smallText,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: TextColors.textSecondary.color,
              ),
            ),
          ],
        ),
        const SizedBox(height: UILayout.xxsmall),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: radius16,
            border: Border.all(color: Colors.borderDefault),
          ),

          child: SizedBox(
            width: double.infinity,

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),

              child: Align(
                alignment: Alignment.center,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: UILayout.medium,
                    fontWeight: FontWeight.w500,
                    color: TextColors.textPrimary.color,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class _GenderRatio extends StatelessWidget {
  const _GenderRatio({required this.maleRatio, required this.femaleRatio});

  final double maleRatio;
  final double femaleRatio;

  @override
  Widget build(BuildContext context) {
    if (maleRatio == 0 && femaleRatio == 0) {
      return Center(
        child: Column(
          children: <Widget>[
            Text(
              'GÉNERO',
              style: TextStyle(
                fontSize: UILayout.smallText,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: TextColors.textSecondary.color,
              ),
            ),
            Spacing.spacingV8,
            Text(
              'Desconocido',
              style: TextStyle(
                fontSize: UILayout.medium,
                color: TextColors.textPrimary.color,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: <Widget>[
        Text(
          'GENERO',
          style: TextStyle(
            fontSize: UILayout.smallText,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: TextColors.textSecondary.color,
          ),
        ),
        Spacing.spacingV12,
        DecoratedBox(
          decoration: BoxDecoration(borderRadius: radius4),
          child: SizedBox(
            height: UILayout.small,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                if (maleRatio > 0)
                  Expanded(
                    flex: (maleRatio * 10).toInt(),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.genderBlue,
                        borderRadius: femaleRatio == 0 ? radius4 : radiusl4,
                      ),
                      child: Spacing.spacingV8,
                    ),
                  ),
                if (femaleRatio > 0)
                  Expanded(
                    flex: (femaleRatio * 10).toInt(),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.genderPink,
                        borderRadius: maleRatio == 0 ? radius4 : radiusr4,
                      ),
                      child: Spacing.spacingV8,
                    ),
                  ),
              ],
            ),
          ),
        ),
        Spacing.spacingV8,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.male,
                  size: UILayout.mediumText,
                  color: TextColors.textSecondary.color,
                ),
                Spacing.spacingH4,
                Text(
                  '${maleRatio.toStringAsFixed(1).replaceAll('.0', '')}%',
                  style: TextStyle(
                    fontSize: UILayout.smallText,
                    color: TextColors.textSecondary.color,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.female,
                  size: UILayout.mediumText,
                  color: TextColors.textSecondary.color,
                ),
                Spacing.spacingH4,
                Text(
                  '${femaleRatio.toStringAsFixed(1).replaceAll('.0', '')}%',
                  style: TextStyle(
                    fontSize: UILayout.smallText,
                    color: TextColors.textSecondary.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
