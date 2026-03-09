import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/dashboards_providers.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/usecases/fetch_pokemons_use_case.dart';
import '../state/dashboard_state.dart';

final NotifierProvider<DashboardViewModel, DashboardState>
dashboardViewModelProvider =
    NotifierProvider<DashboardViewModel, DashboardState>(
      DashboardViewModel.new,
    );

class DashboardViewModel extends Notifier<DashboardState> {
  @override
  DashboardState build() {
    loadPokemons();
    return const DashboardState.loading();
  }

  Future<void> loadPokemons() async {
    try {
      FetchPokemonsUseCase usecase = ref.read(fetchPokemonsUseCaseProvider);

      List<Pokemon> pokemons = await usecase();

      state = DashboardState.data(pokemons);
    } catch (e) {
      state = DashboardState.error(e.toString());
    }
  }
}
