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
        child: LoadedDataPokemonsList(
          searchController: searchController,
          localizations: localizations,
          pokemons: pokemons,
        ),
      ),
    );
  }
}

class LoadedDataPokemonsList extends ConsumerStatefulWidget {
  const LoadedDataPokemonsList({
    required this.searchController,
    required this.localizations,
    required this.pokemons,
    super.key,
  });

  final List<Pokemon> pokemons;
  final TextEditingController searchController;
  final AppLocalizations localizations;

  @override
  ConsumerState<LoadedDataPokemonsList> createState() =>
      _LoadedDataPokemonsListState();
}

class _LoadedDataPokemonsListState
    extends ConsumerState<LoadedDataPokemonsList> {
  Set<String> _selectedTypes = <String>{};

  Future<void> _openFilterSheet() async {
    Set<String>? result = await showTypeFilterBottomSheet(
      context,
      initialSelected: _selectedTypes,
    );
    if (result != null) {
      setState(() => _selectedTypes = result);
    }
  }

  /// Filtra los pokémon según los tipos seleccionados.
  /// Si no hay filtros, retorna la lista completa.
  List<Pokemon> _filteredPokemons() {
    if (_selectedTypes.isEmpty) return widget.pokemons;

    return widget.pokemons.where((Pokemon pokemon) {
      AsyncValue<PokemonSmallDetail> detail = ref.read(
        pokemonDetailProvider(pokemon.id),
      );
      return detail.whenOrNull(
            data: (PokemonSmallDetail d) => d.types.any(
              (String type) => _selectedTypes.contains(type.toLowerCase()),
            ),
          ) ??
          false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Pokemon> pokemons = _filteredPokemons();

    return Column(
      children: <Widget>[
        Spacing.spacingV16,
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: widget.searchController,
                decoration: InputDecoration(
                  hintText: widget.localizations.search_pokemon_hint,
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
                onPressed: _openFilterSheet,
                icon: Icon(Icons.search, color: IconColors.disabled.color),
                padding: const EdgeInsets.all(UILayout.mediumText),
                constraints: const BoxConstraints(),
              ),
            ),
          ],
        ),
        Spacing.spacingV16,
        //Pokemon List
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
