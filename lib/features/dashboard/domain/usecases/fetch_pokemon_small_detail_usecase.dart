import '../entities/pokemon_small_detail.dart';
import '../repositories/dashboard_repository.dart';

class FetchPokemonSmallDetailUseCase {
  FetchPokemonSmallDetailUseCase(this.repository);

  final DashboardRepository repository;

  Future<PokemonSmallDetail> call(int id) =>
      repository.fetchPokemonSmallDetail(id);
}
