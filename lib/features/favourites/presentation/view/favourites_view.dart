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

    return ErrorIllustrationHome(
      title: localizations.error_title_no_favourite,
      subtitle: localizations.error_description_no_favourites,
      illustration: AssetsConstants.illustrationMagikarpError,
    );
  }
}
