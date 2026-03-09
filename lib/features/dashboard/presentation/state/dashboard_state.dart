import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/pokemon.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.error(String message) = _Error;
  const factory DashboardState.data(List<Pokemon> pokemons) = _Data;
}
