part of com.global66.home.pages;

class PokedexDetailView extends ConsumerWidget {
  const PokedexDetailView({required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<PokedexDetail> detail = ref.watch(pokedexDetailProvider(id));
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: detail.when(
        loading: () => const Center(child: PokeBolaLoader()),
        error: (_, __) =>
            Center(child: ErrorLoadingHome(localizations: localizations)),
        data: (PokedexDetail pokemon) => PokedexDetailContent(pokemon: pokemon),
      ),
    );
  }
}
