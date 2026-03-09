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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: UILayout.medium),
      child: Column(
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
        ],
      ),
    );
  }
}
