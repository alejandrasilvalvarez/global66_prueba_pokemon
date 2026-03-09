import '../../domain/entities/pokedex_detail.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/entities/pokemon_small_detail.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../models/mappers/pokedex_detail_mapper.dart';
import '../models/mappers/pokemon_detail_mapper.dart';
import '../models/mappers/pokemon_mapper.dart';
import '../models/pokedex_detail_model.dart';
import '../models/pokemon_list_response.dart';
import '../models/pokemon_model.dart';
import '../models/pokemon_small_detail_model.dart';
import '../models/pokemon_species_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this.remoteDatasource);
  final DashboardRemoteDatasource remoteDatasource;

  @override
  Future<List<Pokemon>> fetchPokemons() async {
    PokemonListResponse response = await remoteDatasource.fetchPokemons();

    return response.results.map((PokemonModel e) => e.toEntity()).toList();
  }

  @override
  Future<PokemonSmallDetail> fetchPokemonSmallDetail(int id) async {
    PokemonSmallDetailModel response = await remoteDatasource
        .fetchPokemonSmallDetail(id);
    return response.toEntity();
  }

  @override
  Future<PokedexDetail> fetchPokedexDetail(int id) async {
    PokedexDetailModel pokemon = await remoteDatasource.fetchPokedexDetail(id);
    PokemonSpeciesModel species = await remoteDatasource.fetchPokemonSpecies(
      id,
    );

    return pokemon.toEntity(species);
  }
}
