import 'package:freezed_annotation/freezed_annotation.dart';
import 'pokemon_model.dart';

part 'pokemon_list_response.freezed.dart';
part 'pokemon_list_response.g.dart';

@Freezed(toJson: false)
abstract class PokemonListResponse with _$PokemonListResponse {
  const factory PokemonListResponse({
    required int count,
    required String? next,
    required String? previous,
    required List<PokemonModel> results,
  }) = _PokemonListResponse;

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);
}
