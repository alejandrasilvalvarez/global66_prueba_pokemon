part of com.global66.home.widgets;

class PokedexDetailContent extends ConsumerWidget {
  const PokedexDetailContent({required this.pokemon, super.key});
  final PokedexDetail pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String mainType = pokemon.types.isNotEmpty ? pokemon.types.first : 'normal';
    PokemonTypeConfig config = PokemonTypeHelper.getConfig(
      PokemonType.fromString(mainType),
    );

    bool isFavorite = ref.watch(
      favouritesProvider.select(
        (Set<int> favorites) => favorites.contains(pokemon.id),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Header layer
        PokemonHeader(
          pokemon: pokemon,
          config: config,
          isFavorite: isFavorite,
          onFavoriteTap: () {
            ref.read(favouritesProvider.notifier).toggleFavorite(pokemon.id);
          },
        ),
        // Content
        Expanded(child: PokedexDetailBody(pokemon: pokemon)),
      ],
    );
  }
}
