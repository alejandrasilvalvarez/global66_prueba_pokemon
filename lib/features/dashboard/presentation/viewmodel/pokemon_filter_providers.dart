import 'package:flutter_riverpod/flutter_riverpod.dart';

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
