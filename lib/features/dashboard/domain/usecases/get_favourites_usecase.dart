import '../repositories/favourites_repository.dart';

class GetFavoritesUseCase {
  GetFavoritesUseCase(this.repository);

  final FavouritesRepository repository;

  Future<Set<int>> call() => repository.getFavorites();
}
