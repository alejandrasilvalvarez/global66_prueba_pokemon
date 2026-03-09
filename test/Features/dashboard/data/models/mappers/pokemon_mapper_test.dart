import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/mappers/pokemon_mapper.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/pokemon_model.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/entities/pokemon.dart';

void main() {
  group('PokemonMapper', () {
    test('toEntity should extract id from url and build imageUrl', () {
      const PokemonModel model = PokemonModel(
        name: 'bulbasaur',
        url: 'https://pokeapi.co/api/v2/pokemon/1/',
      );

      Pokemon entity = model.toEntity();

      expect(entity.id, 1);
      expect(entity.name, 'bulbasaur');
      expect(
        entity.imageUrl,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
      );
    });

    test('toEntity should handle higher ids correctly', () {
      const PokemonModel model = PokemonModel(
        name: 'pikachu',
        url: 'https://pokeapi.co/api/v2/pokemon/25/',
      );

      Pokemon entity = model.toEntity();

      expect(entity.id, 25);
      expect(entity.name, 'pikachu');
      expect(
        entity.imageUrl,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png',
      );
    });
  });
}
