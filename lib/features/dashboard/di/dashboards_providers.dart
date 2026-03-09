// ignore_for_file: always_specify_types
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/http/http_service.dart';
import '../data/datasources/dashboard_remote_datasource.dart';
import '../data/datasources/dashboard_remote_datasource_impl.dart';
import '../data/repositories/dashboard_repository_impl.dart';
import '../domain/entities/pokedex_detail.dart';
import '../domain/entities/pokemon_small_detail.dart';
import '../domain/repositories/dashboard_repository.dart';
import '../domain/usecases/fetch_pokedex_detail_usecase.dart';
import '../domain/usecases/fetch_pokemon_small_detail_usecase.dart';
import '../domain/usecases/fetch_pokemons_use_case.dart';

final Provider<HttpService> httpServiceProvider = Provider<HttpService>(
  (Ref ref) => HttpService(),
);

final Provider<DashboardRemoteDatasource> dashboardDatasourceProvider =
    Provider<DashboardRemoteDatasource>(
      (Ref ref) => DashboardRemoteDatasourceImpl(ref.read(httpServiceProvider)),
    );

final Provider<DashboardRepository> dashboardRepositoryProvider =
    Provider<DashboardRepository>(
      (Ref ref) =>
          DashboardRepositoryImpl(ref.read(dashboardDatasourceProvider)),
    );

final Provider<FetchPokemonsUseCase> fetchPokemonsUseCaseProvider =
    Provider<FetchPokemonsUseCase>(
      (Ref ref) => FetchPokemonsUseCase(ref.read(dashboardRepositoryProvider)),
    );

final Provider<FetchPokemonSmallDetailUseCase>
fetchPokemonSmallDetailUseCaseProvider =
    Provider<FetchPokemonSmallDetailUseCase>(
      (Ref ref) =>
          FetchPokemonSmallDetailUseCase(ref.read(dashboardRepositoryProvider)),
    );

final pokemonDetailProvider = FutureProvider.family<PokemonSmallDetail, int>((
  Ref ref,
  int id,
) async {
  FetchPokemonSmallDetailUseCase useCase = ref.watch(
    fetchPokemonSmallDetailUseCaseProvider,
  );
  return useCase(id);
});

final pokedexDetailProvider = FutureProvider.autoDispose
    .family<PokedexDetail, int>((Ref ref, int id) async {
      FetchPokedexDetailUseCase useCase = ref.watch(
        fetchPokedexDetailUseCaseProvider,
      );
      return useCase(id);
    });

final Provider<FetchPokedexDetailUseCase> fetchPokedexDetailUseCaseProvider =
    Provider<FetchPokedexDetailUseCase>(
      (Ref ref) =>
          FetchPokedexDetailUseCase(ref.watch(dashboardRepositoryProvider)),
    );
