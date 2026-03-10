part of com.global66.home.pages;

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DashboardState state = ref.watch(dashboardViewModelProvider);
    AppLocalizations l10n = AppLocalizations.of(context)!;

    return state.when(
      loading: () => const Center(child: PokeBolaLoader()),
      error: (String message) => ErrorLoadingHome(localizations: l10n),
      data: (_) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: UILayout.medium),
        child: LoadedDataPokemonsList(),
      ),
    );
  }
}

class LoadedDataPokemonsList extends ConsumerWidget {
  const LoadedDataPokemonsList({super.key});

  Future<void> _openFilterSheet(BuildContext context, WidgetRef ref) async {
    Set<String> selected = ref.read(pokemonTypeFilterProvider);

    Set<String>? result = await showTypeFilterBottomSheet(
      context,
      initialSelected: selected,
    );

    if (result != null) {
      ref.read(pokemonTypeFilterProvider.notifier).setFilters(result);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations l10n = AppLocalizations.of(context)!;

    List<Pokemon> pokemons = ref.watch(filteredPokemonsProvider);

    return Column(
      children: <Widget>[
        Spacing.spacingV16,
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: (String value) {
                  ref.read(pokemonSearchProvider.notifier).setQuery(value);
                },
                decoration: InputDecoration(
                  hintText: l10n.search_pokemon_hint,
                  prefixIcon: const Icon(Icons.search_outlined),
                ),
              ),
            ),
            Spacing.spacingH16,
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: BorderColors.defaultColor.color),
              ),
              child: IconButton(
                onPressed: () => _openFilterSheet(context, ref),
                icon: const Icon(Icons.search_outlined),
              ),
            ),
          ],
        ),
        Spacing.spacingV16,
        if (pokemons.isEmpty)
          Expanded(
            child: Center(
              child: ErrorIllustrationHome(
                title: l10n.error_title_no_pokemons,
                subtitle: l10n.error_desc_no_pokemons,
                illustration: AssetsConstants.illustrationMagikarpError,
              ),
            ),
          )
        else
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: UILayout.small),
              itemCount: pokemons.length,
              itemBuilder: (BuildContext context, int index) {
                Pokemon pokemon = pokemons[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: UILayout.smallText),
                  child: PokemonCard(
                    id: pokemon.id.toString(),
                    imageUrl: pokemon.imageUrl,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
