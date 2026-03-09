import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../models/mappers/pokemon_mapper.dart';
import '../models/pokemon_list_response.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this.remoteDatasource);
  final DashboardRemoteDatasource remoteDatasource;

  @override
  Future<List<Pokemon>> fetchPokemons() async {
    final PokemonListResponse response = await remoteDatasource.fetchPokemons();

    return response.results.map((e) => e.toEntity()).toList();
  }
}
