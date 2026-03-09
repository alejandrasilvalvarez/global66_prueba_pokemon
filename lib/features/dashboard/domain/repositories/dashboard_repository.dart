import '../entities/pokemon.dart';

// ignore: one_member_abstracts
abstract class DashboardRepository {
  Future<List<Pokemon>> fetchPokemons();
}
