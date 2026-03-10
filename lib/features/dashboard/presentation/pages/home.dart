part of com.global66.home.pages;

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  TextEditingController searchController = TextEditingController();
  bool hasErrorInput = false;
  String serverError = '';

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    DashboardState state = ref.watch(dashboardViewModelProvider);

    return state.when(
      loading: () => const Center(child: PokeBolaLoader()),
      error: (String message) => ErrorLoadingHome(localizations: localizations),
      data: (List<Pokemon> pokemons) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: UILayout.medium),
        child: LoadedDataPokemonsList(pokemons: pokemons),
      ),
    );
  }
}

class LoadedDataPokemonsList extends ConsumerWidget {
  const LoadedDataPokemonsList({required this.pokemons, super.key});

  final List<Pokemon> pokemons;

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
    Set<String> selectedTypes = ref.watch(pokemonTypeFilterProvider);

    List<Pokemon> filtered = pokemons.where((Pokemon pokemon) {
      if (selectedTypes.isEmpty) {
        return true;
      }

      AsyncValue<PokemonSmallDetail> detail = ref.watch(
        pokemonDetailProvider(pokemon.id),
      );

      return detail.whenOrNull(
            data: (PokemonSmallDetail d) => d.types.any(
              (String type) => selectedTypes.contains(type.toLowerCase()),
            ),
          ) ??
          false;
    }).toList();

    return Column(
      children: <Widget>[
        Spacing.spacingV16,
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
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
        if (filtered.isEmpty)
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
              itemCount: filtered.length,
              itemBuilder: (BuildContext context, int index) {
                Pokemon pokemon = filtered[index];

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
