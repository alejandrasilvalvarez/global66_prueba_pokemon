import '../../domain/entities/pokemon.dart';
import '../../domain/entities/pokemon_detail.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../models/mappers/pokemon_detail_mapper.dart';
import '../models/mappers/pokemon_mapper.dart';
import '../models/pokemon_detail_model.dart';
import '../models/pokemon_list_response.dart';
import '../models/pokemon_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this.remoteDatasource);
  final DashboardRemoteDatasource remoteDatasource;

  @override
  Future<List<Pokemon>> fetchPokemons() async {
    PokemonListResponse response = await remoteDatasource.fetchPokemons();

    return response.results.map((PokemonModel e) => e.toEntity()).toList();
  }

  @override
  Future<PokemonSmallDetail> fetchPokemonDetail(int id) async {
    PokemonSmallDetailModel response = await remoteDatasource
        .fetchPokemonDetail(id);
    return response.toEntity();
  }
}
