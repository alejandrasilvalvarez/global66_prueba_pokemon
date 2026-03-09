import '../../../domain/entities/pokemon.dart';
import '../pokemon_model.dart';

extension PokemonMapper on PokemonModel {
  Pokemon toEntity() => Pokemon(name: name, url: url);
}
