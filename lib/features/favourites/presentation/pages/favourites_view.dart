part of com.global66.favourites.pages;

class FavouritesView extends ConsumerWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    Set<int> favorites = ref.watch(favouritesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: UILayout.medium,
          ),
          onPressed: () {
            ref.read(navigationViewModelProvider.notifier).onTabSelected(0);
            context.go('/home');
          },
        ),
        title: Text(
          localizations.navbar_favourites,
          style: const TextStyle(
            color: Colors.black,
            fontSize: UILayout.large,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: favorites.isEmpty
          ? Center(
              child: ErrorIllustrationHome(
                title: localizations.error_title_no_favourite,
                subtitle: localizations.error_description_no_favourites,
                illustration: AssetsConstants.illustrationMagikarpError,
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: UILayout.medium),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: UILayout.medium,
                ),
                itemCount: favorites.length,
                itemBuilder: (BuildContext context, int index) {
                  int id = favorites.elementAt(index);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: UILayout.smallText),
                    child: PokemonCard(
                      id: id.toString(),
                      imageUrl:
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
                    ),
                  );
                },
              ),
            ),
    );
  }
}
