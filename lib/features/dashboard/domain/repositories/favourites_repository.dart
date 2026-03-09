abstract class FavouritesRepository {
  Future<Set<int>> getFavorites();
  Future<void> saveFavorites(Set<int> favorites);
}
