import '../entities/pokemon.dart';
import '../repositories/dashboard_repository.dart';

class FetchPokemonsUseCase {
  FetchPokemonsUseCase(this.repository);

  final DashboardRepository repository;

  Future<List<Pokemon>> call() => repository.fetchPokemons();
}
