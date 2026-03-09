import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/src/providers/future_provider.dart';

import '../data/datasources/dashboard_remote_datasource_impl.dart';
import '../data/repositories/dashboard_repository_impl.dart';
import '../domain/entities/pokemon_small_detail.dart';
import '../domain/usecases/fetch_pokemons_use_case.dart';

final Provider<Dio> dioProvider = Provider<Dio>((Ref ref) => Dio());

final Provider<DashboardRemoteDatasourceImpl> dashboardDatasourceProvider =
    Provider<DashboardRemoteDatasourceImpl>(
      (Ref ref) => DashboardRemoteDatasourceImpl(ref.read(dioProvider)),
    );

final Provider<DashboardRepositoryImpl> dashboardRepositoryProvider =
    Provider<DashboardRepositoryImpl>(
      (Ref ref) =>
          DashboardRepositoryImpl(ref.read(dashboardDatasourceProvider)),
    );

final Provider<FetchPokemonsUseCase> fetchPokemonsUseCaseProvider =
    Provider<FetchPokemonsUseCase>(
      (Ref ref) => FetchPokemonsUseCase(ref.read(dashboardRepositoryProvider)),
    );

final FutureProviderFamily<PokemonSmallDetail, int> pokemonDetailProvider =
    FutureProvider.family<PokemonSmallDetail, int>((Ref ref, int id) async {
      DashboardRepositoryImpl repo = ref.read(dashboardRepositoryProvider);
      return repo.fetchPokemonDetail(id);
    });
