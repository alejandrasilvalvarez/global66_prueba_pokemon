import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/favourites_providers.dart';
import '../../domain/repositories/favourites_repository.dart';

final NotifierProvider<FavoritesViewModel, Set<int>> favouritesProvider =
    NotifierProvider<FavoritesViewModel, Set<int>>(FavoritesViewModel.new);

class FavoritesViewModel extends Notifier<Set<int>> {
  @override
  Set<int> build() {
    loadFavorites();
    return <int>{};
  }

  Future<void> loadFavorites() async {
    FavouritesRepository repo = ref.read(favouritesRepositoryProvider);

    Set<int> favorites = await repo.getFavorites();

    state = favorites;
  }

  Future<void> toggleFavorite(int id) async {
    FavouritesRepository repo = ref.read(favouritesRepositoryProvider);

    Set<int> newFavorites = <int>{...state};

    if (newFavorites.contains(id)) {
      newFavorites.remove(id);
    } else {
      newFavorites.add(id);
    }

    state = newFavorites;

    await repo.saveFavorites(newFavorites);
  }
}
