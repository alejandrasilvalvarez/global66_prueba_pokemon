import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/mappers/pokemon_detail_mapper.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/pokemon_small_detail_model.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/entities/pokemon_small_detail.dart';

void main() {
  group('PokemonSmallDetailMapper', () {
    test('toEntity should map model fields correctly', () {
      const PokemonSmallDetailModel model = PokemonSmallDetailModel(
        id: 1,
        name: 'bulbasaur',
        types: <TypeSlotModel>[
          TypeSlotModel(type: TypeModel(name: 'grass')),
          TypeSlotModel(type: TypeModel(name: 'poison')),
        ],
      );

      PokemonSmallDetail entity = model.toEntity();

      expect(entity.id, 1);
      expect(entity.name, 'bulbasaur');
      expect(entity.types, <String>['grass', 'poison']);
    });

    test('toEntity should handle a single type', () {
      const PokemonSmallDetailModel model = PokemonSmallDetailModel(
        id: 25,
        name: 'pikachu',
        types: <TypeSlotModel>[
          TypeSlotModel(type: TypeModel(name: 'electric')),
        ],
      );

      PokemonSmallDetail entity = model.toEntity();

      expect(entity.id, 25);
      expect(entity.name, 'pikachu');
      expect(entity.types, <String>['electric']);
    });

    test('toEntity should handle empty types list', () {
      const PokemonSmallDetailModel model = PokemonSmallDetailModel(
        id: 999,
        name: 'missingno',
        types: <TypeSlotModel>[],
      );

      PokemonSmallDetail entity = model.toEntity();

      expect(entity.types, isEmpty);
    });
  });
}
