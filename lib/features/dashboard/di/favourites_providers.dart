import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../data/datasources/favourites_local_datasource.dart';
import '../data/repositories/favourites_repository_impl.dart';
import '../domain/repositories/favourites_repository.dart';
import '../domain/usecases/get_favourites_usecase.dart';
import '../domain/usecases/toggle_favourite_pokemon.dart';

final Provider<FlutterSecureStorage> secureStorageProvider =
    Provider<FlutterSecureStorage>((_) => const FlutterSecureStorage());

final Provider<FavouritesLocalDatasource> favouritesDatasourceProvider =
    Provider<FavouritesLocalDatasource>(
      (Ref ref) => FavouritesLocalDatasource(ref.read(secureStorageProvider)),
    );

final Provider<FavouritesRepository> favouritesRepositoryProvider =
    Provider<FavouritesRepository>(
      (Ref ref) =>
          FavouritesRepositoryImpl(ref.read(favouritesDatasourceProvider)),
    );

final Provider<GetFavoritesUseCase> getFavoritesUseCaseProvider =
    Provider<GetFavoritesUseCase>(
      (Ref ref) => GetFavoritesUseCase(ref.read(favouritesRepositoryProvider)),
    );

final Provider<ToggleFavoritePokemon> toggleFavoritePokemonProvider =
    Provider<ToggleFavoritePokemon>(
      (Ref ref) =>
          ToggleFavoritePokemon(ref.read(favouritesRepositoryProvider)),
    );
