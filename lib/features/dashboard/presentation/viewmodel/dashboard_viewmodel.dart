import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/pokemon.dart';
import 'dashboard_providers.dart';

final dashboardViewModelProvider =
    AsyncNotifierProvider<DashboardViewModel, List<Pokemon>>(
      DashboardViewModel.new,
    );

class DashboardViewModel extends AsyncNotifier<List<Pokemon>> {
  @override
  Future<List<Pokemon>> build() async {
    final usecase = ref.read(fetchPokemonsUseCaseProvider);
    return usecase();
  }
}
