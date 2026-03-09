import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokedex_detail_model.freezed.dart';
part 'pokedex_detail_model.g.dart';

@freezed
abstract class PokedexDetailModel with _$PokedexDetailModel {
  const factory PokedexDetailModel({
    required int id,
    required String name,
    required int weight,
    required int height,
    required Sprites sprites,
    required List<TypeSlot> types,
    required List<AbilitySlot> abilities,
  }) = _PokedexDetailModel;

  factory PokedexDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokedexDetailModelFromJson(json);
}

@freezed
abstract class Sprites with _$Sprites {
  const factory Sprites({required OtherSprites other}) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
}

@freezed
abstract class OtherSprites with _$OtherSprites {
  const factory OtherSprites({
    @JsonKey(name: 'official-artwork') required OfficialArtwork officialArtwork,
  }) = _OtherSprites;

  factory OtherSprites.fromJson(Map<String, dynamic> json) =>
      _$OtherSpritesFromJson(json);
}

@freezed
abstract class OfficialArtwork with _$OfficialArtwork {
  const factory OfficialArtwork({
    @JsonKey(name: 'front_default') required String imageUrl,
  }) = _OfficialArtwork;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);
}

@freezed
abstract class TypeSlot with _$TypeSlot {
  const factory TypeSlot({required int slot, required TypeInfo type}) =
      _TypeSlot;

  factory TypeSlot.fromJson(Map<String, dynamic> json) =>
      _$TypeSlotFromJson(json);
}

@freezed
abstract class TypeInfo with _$TypeInfo {
  const factory TypeInfo({required String name}) = _TypeInfo;

  factory TypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoFromJson(json);
}

@freezed
abstract class AbilitySlot with _$AbilitySlot {
  const factory AbilitySlot({required AbilityInfo ability}) = _AbilitySlot;

  factory AbilitySlot.fromJson(Map<String, dynamic> json) =>
      _$AbilitySlotFromJson(json);
}

@freezed
abstract class AbilityInfo with _$AbilityInfo {
  const factory AbilityInfo({required String name}) = _AbilityInfo;

  factory AbilityInfo.fromJson(Map<String, dynamic> json) =>
      _$AbilityInfoFromJson(json);
}
