import '../../../domain/entities/pokemon_detail.dart';
import '../pokemon_detail_model.dart';

extension PokemonDetailMapper on PokemonDetailModel {
  PokemonDetail toEntity() => PokemonDetail(
    id: id,
    types: types.map((TypeSlotModel e) => e.type.name).toList(),
  );
}
