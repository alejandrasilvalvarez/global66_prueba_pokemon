import '../entities/pokedex_detail.dart';
import '../repositories/dashboard_repository.dart';

class FetchPokedexDetailUseCase {
  FetchPokedexDetailUseCase(this.repository);

  final DashboardRepository repository;

  Future<PokedexDetail> call(int id) => repository.fetchPokedexDetail(id);
}
