import '../../../domain/entities/pokemon_small_detail.dart';
import '../pokemon_small_detail_model.dart';

extension PokemonSmallDetailMapper on PokemonSmallDetailModel {
  PokemonSmallDetail toEntity() => PokemonSmallDetail(
    id: id,
    types: types.map((TypeSlotModel e) => e.type.name).toList(),
    name: name,
  );
}
