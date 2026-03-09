import '../../domain/repositories/favourites_repository.dart';
import '../datasources/favourites_local_datasource.dart';

class FavouritesRepositoryImpl implements FavouritesRepository {
  FavouritesRepositoryImpl(this.datasource);
  final FavouritesLocalDatasource datasource;

  @override
  Future<Set<int>> getFavorites() => datasource.getFavorites();

  @override
  Future<void> saveFavorites(Set<int> favorites) =>
      datasource.saveFavorites(favorites);
}
