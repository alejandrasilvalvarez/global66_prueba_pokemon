import '../models/pokemon_small_detail_model.dart';
import '../models/pokemon_list_response.dart';

abstract class DashboardRemoteDatasource {
  Future<PokemonListResponse> fetchPokemons();
  Future<PokemonSmallDetailModel> fetchPokemonDetail(int id);
}
