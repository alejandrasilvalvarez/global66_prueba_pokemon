import '../../../domain/entities/pokemon_detail.dart';
import '../pokemon_detail_model.dart';

extension PokemonDetailMapper on PokemonSmallDetailModel {
  PokemonSmallDetail toEntity() => PokemonSmallDetail(
    id: id,
    types: types.map((TypeSlotModel e) => e.type.name).toList(),
    name: name,
  );
}
