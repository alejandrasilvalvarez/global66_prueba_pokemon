import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/favourites_providers.dart';
import '../../domain/usecases/get_favourites_usecase.dart';
import '../../domain/usecases/toggle_favourite_pokemon.dart';

final NotifierProvider<FavoritesViewModel, Set<int>> favouritesProvider =
    NotifierProvider<FavoritesViewModel, Set<int>>(FavoritesViewModel.new);

class FavoritesViewModel extends Notifier<Set<int>> {
  @override
  Set<int> build() {
    loadFavorites();
    return <int>{};
  }

  Future<void> loadFavorites() async {
    GetFavoritesUseCase useCase = ref.read(getFavoritesUseCaseProvider);

    Set<int> favorites = await useCase();

    state = favorites;
  }

  Future<void> toggleFavorite(int id) async {
    ToggleFavoritePokemon useCase = ref.read(toggleFavoritePokemonProvider);

    Set<int> updatedFavorites = await useCase(id);

    state = updatedFavorites;
  }
}
