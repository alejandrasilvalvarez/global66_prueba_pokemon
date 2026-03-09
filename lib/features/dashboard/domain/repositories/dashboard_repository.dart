import '../entities/pokemon.dart';
import '../entities/pokemon_detail.dart';

// ignore: one_member_abstracts
abstract class DashboardRepository {
  Future<List<Pokemon>> fetchPokemons();
  Future<PokemonDetail> fetchPokemonDetail(int id);
}
