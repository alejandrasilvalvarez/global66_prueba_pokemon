import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/internacionalization/l10n/app_localizations.dart';
import '../../../design_system/ui_constants/poke_icons_icons.dart';
import '../state/navigation_state.dart';
import '../viewmodel/navigation_viewmodel.dart';

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
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          ref.read(navigationViewModelProvider.notifier).onTabSelected(index);
          navigationShell.goBranch(index);
        },
        destinations: <Widget>[
          NavigationDestination(
            icon: const Icon(PokeIcons.home),
            label: localizations.navbar_pokedex,
          ),
          NavigationDestination(
            icon: const Icon(PokeIcons.globe_1),
            label: localizations.navbar_regions,
          ),
          NavigationDestination(
            icon: const Icon(PokeIcons.favorite),
            label: localizations.navbar_favourites,
          ),
          NavigationDestination(
            icon: const Icon(PokeIcons.user),
            label: localizations.navbar_profile,
          ),
        ],
      ),
    );
  }
}
