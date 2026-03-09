import '../models/pokemon_detail_model.dart';
import '../models/pokemon_list_response.dart';

abstract class DashboardRemoteDatasource {
  Future<PokemonListResponse> fetchPokemons();
  Future<PokemonDetailModel> fetchPokemonDetail(int id);
}
