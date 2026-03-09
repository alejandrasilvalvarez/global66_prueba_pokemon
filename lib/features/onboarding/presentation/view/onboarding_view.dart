part of com.global66.onboarding.views;

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale currentLocale = ref.watch(localeProvider);
    String currentLanguageLabel = supportedLanguages.entries
        .firstWhere(
          (MapEntry<String, Locale> entry) =>
              entry.value.languageCode == currentLocale.languageCode,
        )
        .key;
    OnboardingState state = ref.watch(onboardingViewModelProvider);
    OnboardingViewModel vm = ref.read(onboardingViewModelProvider.notifier);

    AppLocalizations localizations = AppLocalizations.of(context)!;

    List<Map<String, String>> onboardingData = <Map<String, String>>[
      <String, String>{
        'image': AssetsConstants.illustrationTrainer,
        'title': localizations.onboarding_title_all_pokemons_in_the_same_place,
        'desc': localizations.onboarding_description_all_pokemon,
      },
      <String, String>{
        'image': AssetsConstants.illustrationHilda,
        'title': localizations.onboarding_title_keep_updated,
        'desc': localizations.onboarding_description_profile,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: vm.pageController,
                onPageChanged: vm.onPageChanged,
                itemCount: onboardingData.length,
                itemBuilder: (_, int index) => OnboardingCarouselContent(
                  image: onboardingData[index]['image']!,
                  title: onboardingData[index]['title']!,
                  description: onboardingData[index]['desc']!,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                onboardingData.length,
                (int index) => OnboardingCarouselDot(
                  index: index,
                  currentPage: state.currentPage,
                ),
              ),
            ),
            Spacing.spacingV24,
            Padding(
              padding: const EdgeInsets.all(UILayout.large),
              child: SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  onPressed: () => vm.nextPage(
                    onboardingData.length,
                    () => context.go('/home'),
                  ),
                  label: state.currentPage == onboardingData.length - 1
                      ? localizations.begin
                      : localizations.onboarding_continue,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: UILayout.medium),
            child: DropdownButton<String>(
              value: currentLanguageLabel,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  ref.read(localeProvider.notifier).state =
                      supportedLanguages[newValue]!;
                }
              },
              items: supportedLanguages.keys
                  .map(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
