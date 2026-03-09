import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_species_model.freezed.dart';
part 'pokemon_species_model.g.dart';

@freezed
abstract class PokemonSpeciesModel with _$PokemonSpeciesModel {
  const factory PokemonSpeciesModel({
    @JsonKey(name: 'flavor_text_entries')
    required List<FlavorTextEntry> flavorTextEntries,
    required List<Genus> genera,
    @JsonKey(name: 'gender_rate') required int genderRate,
  }) = _PokemonSpeciesModel;

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesModelFromJson(json);
}

@freezed
abstract class FlavorTextEntry with _$FlavorTextEntry {
  const factory FlavorTextEntry({
    @JsonKey(name: 'flavor_text') required String flavorText,
    required Language language,
  }) = _FlavorTextEntry;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntryFromJson(json);
}

@freezed
abstract class Genus with _$Genus {
  const factory Genus({required String genus, required Language language}) =
      _Genus;

  factory Genus.fromJson(Map<String, dynamic> json) => _$GenusFromJson(json);
}

@freezed
abstract class Language with _$Language {
  const factory Language({required String name}) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}
