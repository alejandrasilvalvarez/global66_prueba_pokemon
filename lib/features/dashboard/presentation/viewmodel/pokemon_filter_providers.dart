import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/dashboards_providers.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/entities/pokemon_small_detail.dart';
import '../state/dashboard_state.dart';
import 'dashboard_viewmodel.dart';

final NotifierProvider<PokemonTypeFilterNotifier, Set<String>>
pokemonTypeFilterProvider =
    NotifierProvider<PokemonTypeFilterNotifier, Set<String>>(
      PokemonTypeFilterNotifier.new,
    );

class PokemonTypeFilterNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() => <String>{};

  void setFilters(Set<String> filters) {
    state = filters;
  }

  void toggle(String type) {
    if (state.contains(type)) {
      state = <String>{...state}..remove(type);
    } else {
      state = <String>{...state, type};
    }
  }

  void clear() {
    state = <String>{};
  }
}

final NotifierProvider<PokemonSearchNotifier, String> pokemonSearchProvider =
    NotifierProvider<PokemonSearchNotifier, String>(PokemonSearchNotifier.new);

class PokemonSearchNotifier extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String query) {
    state = query.toLowerCase().trim();
  }

  void clear() {
    state = '';
  }
}

final Provider<List<Pokemon>> filteredPokemonsProvider =
    Provider<List<Pokemon>>((Ref ref) {
      DashboardState dashboardState = ref.watch(dashboardViewModelProvider);
      Set<String> selectedTypes = ref.watch(pokemonTypeFilterProvider);
      String query = ref.watch(pokemonSearchProvider);

      return dashboardState.maybeWhen(
        data: (List<Pokemon> pokemons) => pokemons.where((Pokemon pokemon) {
          /// filtro por texto
          bool matchesSearch =
              query.isEmpty || pokemon.name.toLowerCase().contains(query);

          /// filtro por tipo
          if (selectedTypes.isEmpty) {
            return matchesSearch;
          }

          AsyncValue<PokemonSmallDetail> detail = ref.watch(
            pokemonDetailProvider(pokemon.id),
          );

          bool matchesType =
              detail.whenOrNull(
                data: (PokemonSmallDetail d) => d.types.any(
                  (String type) => selectedTypes.contains(type.toLowerCase()),
                ),
              ) ??
              false;

          return matchesSearch && matchesType;
        }).toList(),
        orElse: () => <Pokemon>[],
      );
    });
