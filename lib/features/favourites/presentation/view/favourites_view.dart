part of com.global66.favourites.views;

class FavouritesView extends ConsumerStatefulWidget {
  const FavouritesView({super.key});

  @override
  ConsumerState<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends ConsumerState<FavouritesView> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    Set<int> favorites = ref.watch(favouritesProvider);

    if (favorites.isEmpty) {
      return ErrorIllustrationHome(
        title: localizations.error_title_no_favourite,
        subtitle: localizations.error_description_no_favourites,
        illustration: AssetsConstants.illustrationMagikarpError,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: UILayout.medium),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: UILayout.medium),
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index) {
          int id = favorites.elementAt(index);

          return Padding(
            padding: const EdgeInsets.only(bottom: UILayout.smallText),
            child: PokemonCard(
              id: id.toString(),
              name: 'Pokemon',
              imageUrl:
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
            ),
          );
        },
      ),
    );
  }
}
