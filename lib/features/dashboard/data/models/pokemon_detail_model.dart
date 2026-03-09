import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail_model.freezed.dart';
part 'pokemon_detail_model.g.dart';

@freezed
abstract class PokemonDetailModel with _$PokemonDetailModel {
  const factory PokemonDetailModel({
    required int id,
    required String name,
    required List<TypeSlotModel> types,
  }) = _PokemonDetailModel;

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailModelFromJson(json);
}

@freezed
abstract class TypeSlotModel with _$TypeSlotModel {
  const factory TypeSlotModel({required TypeModel type}) = _TypeSlotModel;

  factory TypeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$TypeSlotModelFromJson(json);
}

@freezed
abstract class TypeModel with _$TypeModel {
  const factory TypeModel({required String name}) = _TypeModel;

  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);
}
