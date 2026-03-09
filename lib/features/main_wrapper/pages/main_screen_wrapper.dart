part of com.global66.main_wrapper.pages;

class MainScreen extends ConsumerWidget {
  const MainScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    int selectedIndex = ref.watch(
      navigationViewModelProvider.select(
        (NavigationState s) => s.selectedIndex,
      ),
    );

    return Scaffold(
      body: SafeArea(child: navigationShell),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: TapBar.borderTop.color,
          border: Border(
            top: BorderSide(color: Colors.black.withValues(alpha: 0.1)),
          ),
          borderRadius: radiust8,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: radiust8,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: TapBar.iconActive.color,
            unselectedItemColor: TapBar.iconDefault.color,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            currentIndex: selectedIndex,
            onTap: (int index) {
              ref
                  .read(navigationViewModelProvider.notifier)
                  .onTabSelected(index);
              navigationShell.goBranch(index);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(
                    top: UILayout.medium,
                    bottom: UILayout.small,
                  ),
                  child: Icon(PokeIcons.home),
                ),
                label: localizations.navbar_pokedex,
              ),
              BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(
                    top: UILayout.medium,
                    bottom: UILayout.small,
                  ),
                  child: Icon(PokeIcons.globe_1),
                ),
                label: localizations.navbar_regions,
              ),
              BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(
                    top: UILayout.medium,
                    bottom: UILayout.small,
                  ),
                  child: Icon(PokeIcons.favorite),
                ),
                label: localizations.navbar_favourites,
              ),
              BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(
                    top: UILayout.medium,
                    bottom: UILayout.small,
                  ),
                  child: Icon(PokeIcons.user),
                ),
                label: localizations.navbar_profile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
