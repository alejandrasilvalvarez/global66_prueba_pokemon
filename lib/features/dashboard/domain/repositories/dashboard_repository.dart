import '../entities/pokemon.dart';
import '../entities/pokemon_small_detail.dart';

// ignore: one_member_abstracts
abstract class DashboardRepository {
  Future<List<Pokemon>> fetchPokemons();
  Future<PokemonSmallDetail> fetchPokemonDetail(int id);
}
