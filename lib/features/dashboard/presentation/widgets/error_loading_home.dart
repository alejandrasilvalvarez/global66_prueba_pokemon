part of com.global66.home.widgets;

class ErrorLoadingHome extends StatelessWidget {
  const ErrorLoadingHome({required this.localizations, super.key});

  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: UILayout.medium),
      child: Column(
        children: <Widget>[
          ErrorIllustrationHome(
            title: localizations.generic_error_title,
            subtitle: localizations.error_loading_information,
            illustration: AssetsConstants.illustrationMagikarpError,
          ),
          Spacing.spacingV16,
          PrimaryButton(label: localizations.error_retry_button),
        ],
      ),
    ),
  );
}
