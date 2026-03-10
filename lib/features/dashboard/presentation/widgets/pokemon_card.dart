part of com.global66.home.widgets;

class PokemonCard extends ConsumerWidget {
  const PokemonCard({required this.id, required this.imageUrl, super.key});

  final String id;
  final String imageUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    int pokemonId = int.parse(id);

    AsyncValue<PokemonSmallDetail> detail = ref.watch(
      pokemonDetailProvider(pokemonId),
    );

    bool isFavorite = ref.watch(
      favouritesProvider.select(
        (Set<int> favorites) => favorites.contains(pokemonId),
      ),
    );

    return detail.when(
      data: (PokemonSmallDetail pokemon) {
        String mainType = pokemon.types.isNotEmpty
            ? pokemon.types.first
            : 'normal';

        PokemonTypeConfig config = PokemonTypeHelper.getConfig(
          PokemonType.fromString(mainType),
        );

        return InkWell(
          borderRadius: BorderRadius.circular(UILayout.medium),
          onTap: () {
            context.push('/pokemon/${pokemon.id}');
          },
          child: SizedBox(
            height: 104,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: config.color.withAlpha(128),
                borderRadius: BorderRadius.circular(UILayout.medium),
              ),
              child: Row(
                children: <Widget>[
                  // LADO IZQUIERDO: Información
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: UILayout.medium,
                        vertical: UILayout.mediumText,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            localizations.number(id),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: UILayout.smallText,
                              color: TextColors.textSecondary.color,
                            ),
                          ),
                          Text(
                            pokemon.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: UILayout.largeText,
                              color: TextColors.textPrimary.color,
                            ),
                          ),
                          Spacing.spacingV4,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ...pokemon.types.map((String type) {
                                PokemonTypeConfig tConfig =
                                    PokemonTypeHelper.getConfig(
                                      PokemonType.fromString(type),
                                    );
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    right: UILayout.small,
                                  ),
                                  child: PokemonTypeFlag(
                                    iconPath: tConfig.icon,
                                    label: tConfig.label,
                                    typeColor: tConfig.color,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // LADO DERECHO: Visual
                  Expanded(
                    flex: 2,
                    child: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: config.color,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(UILayout.medium),
                            ),
                          ),
                        ),

                        // Icono de fondo (Marca de agua)
                        Center(
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
                              height: UILayout.xxlarge,
                            ),
                          ),
                        ),

                        // Imagen del Pokémon
                        Center(
                          child: Image.network(
                            imageUrl,
                            height: UILayout.xxlarge,
                            fit: BoxFit.contain,
                            cacheHeight: 200,
                            cacheWidth: 200,
                            errorBuilder: (_, __, ___) =>
                                const SizedBox.shrink(),
                          ),
                        ),

                        // Botón de Favorito
                        Positioned(
                          top: UILayout.small,
                          right: UILayout.small,
                          child: FavouriteButton(
                            isFavorite: isFavorite,
                            onTap: () {
                              ref
                                  .read(favouritesProvider.notifier)
                                  .toggleFavorite(int.parse(id));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) => const SizedBox.shrink(),
      loading: () => const PokemonCardShimmer(),
    );
  }
}
