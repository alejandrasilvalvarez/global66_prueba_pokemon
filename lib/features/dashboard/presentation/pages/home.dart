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
    AsyncValue<List<Pokemon>> state = ref.watch(dashboardViewModelProvider);

    return state.when(
      data: (List<Pokemon> pokemons) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: UILayout.medium),
        child: LoadedDataPokemonsList(
          searchController: searchController,
          localizations: localizations,
          pokemons: pokemons,
        ),
      ),
      error: (Object error, StackTrace stack) =>
          ErrorLoadingHome(localizations: localizations),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class LoadedDataPokemonsList extends StatelessWidget {
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
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      Spacing.spacingV16,
      Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: localizations.search_pokemon_hint,
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
              onPressed: () {},
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
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: UILayout.small),
          children: <Widget>[
            ...pokemons.map(
              (Pokemon pokemon) => Padding(
                padding: const EdgeInsets.only(bottom: UILayout.smallText),
                child: PokemonCard(
                  id: pokemon.id.toString(),
                  name: pokemon.name,
                  imageUrl: pokemon.imageUrl,
                  isFavorite: false,
                  types: <String>['Pasto', 'Veneno'],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
