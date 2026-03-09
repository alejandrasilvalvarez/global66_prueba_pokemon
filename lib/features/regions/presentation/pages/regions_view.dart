part of com.global66.regions.pages;

class RegionsView extends ConsumerWidget {
  const RegionsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return ErrorIllustrationHome(
      title: localizations.error_title_coming_soon,
      subtitle: localizations.error_description_coming_soon,
      illustration: AssetsConstants.illustrationJigglypuffError,
    );
  }
}
