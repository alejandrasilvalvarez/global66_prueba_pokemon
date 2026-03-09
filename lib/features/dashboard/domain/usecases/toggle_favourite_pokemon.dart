import '../repositories/favourites_repository.dart';

class ToggleFavoritePokemon {
  ToggleFavoritePokemon(this.repository);
  final FavouritesRepository repository;

  Future<Set<int>> call(int id) async {
    Set<int> favorites = await repository.getFavorites();

    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }

    await repository.saveFavorites(favorites);

    return favorites;
  }
}
