abstract class FavouritesLocalDatasource {
  Future<Set<int>> getFavorites();
  Future<void> saveFavorites(Set<int> favorites);
}
