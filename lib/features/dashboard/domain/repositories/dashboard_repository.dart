import '../entities/pokedex_detail.dart';
import '../entities/pokemon.dart';
import '../entities/pokemon_small_detail.dart';

abstract class DashboardRepository {
  Future<List<Pokemon>> fetchPokemons();
  Future<PokemonSmallDetail> fetchPokemonSmallDetail(int id);
  Future<PokedexDetail> fetchPokedexDetail(int id);
}
