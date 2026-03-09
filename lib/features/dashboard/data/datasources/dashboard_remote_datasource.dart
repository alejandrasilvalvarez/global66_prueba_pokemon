import '../models/pokedex_detail_model.dart';
import '../models/pokemon_list_response.dart';
import '../models/pokemon_small_detail_model.dart';
import '../models/pokemon_species_model.dart';

abstract class DashboardRemoteDatasource {
  Future<PokemonListResponse> fetchPokemons();
  Future<PokemonSmallDetailModel> fetchPokemonSmallDetail(int id);
  Future<PokedexDetailModel> fetchPokedexDetail(int id);
  Future<PokemonSpeciesModel> fetchPokemonSpecies(int id);
}
