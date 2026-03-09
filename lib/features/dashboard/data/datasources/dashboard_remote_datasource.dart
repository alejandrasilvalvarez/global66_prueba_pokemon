import '../models/pokemon_list_response.dart';

// ignore: one_member_abstracts
abstract class DashboardRemoteDatasource {
  Future<PokemonListResponse> fetchPokemons();
}
