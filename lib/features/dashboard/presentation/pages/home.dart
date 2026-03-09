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

    return ErrorLoadingHome(localizations: localizations);
  }
}

class ErrorLoadingHome extends StatelessWidget {
  const ErrorLoadingHome({required this.localizations, super.key});

  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: UILayout.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[
          Image.asset(
            AssetsConstants.illustrationMagikarpError,
            fit: BoxFit.contain,
            width: 185,
          ),
          Spacing.spacingV16,
          Text(
            localizations.generic_error_title,
            style: TextStyle(
              color: Colors.escalaDeCinza[800],
              fontWeight: FontWeight.w600,
              fontSize: UILayout.largeText,
            ),
          ),
          Spacing.spacingV16,
          Text(
            localizations.error_loading_information,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.escalaDeCinza[700],
              fontSize: UILayout.mediumText,
            ),
          ),
          Spacing.spacingV16,
          PrimaryButton(label: localizations.error_retry_button),
          const SizedBox(width: double.infinity),
        ],
      ),
    ),
  );
}
