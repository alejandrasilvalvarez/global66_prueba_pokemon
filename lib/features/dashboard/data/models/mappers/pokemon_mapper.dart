import '../../../../../core/util/pokemon_utils.dart';
import '../../../domain/entities/pokemon.dart';
import '../pokemon_model.dart';

extension PokemonMapper on PokemonModel {
  Pokemon toEntity() {
    int id = extractPokemonId(url);

    return Pokemon(
      id: id,
      name: name,
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
    );
  }
}
