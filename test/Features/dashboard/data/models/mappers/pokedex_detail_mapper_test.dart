import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/mappers/pokedex_detail_mapper.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/pokedex_detail_model.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/pokemon_species_model.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/entities/pokedex_detail.dart';

void main() {
  group('PokedexDetailMapper', () {
    const PokedexDetailModel tModel = PokedexDetailModel(
      id: 1,
      name: 'bulbasaur',
      weight: 69,
      height: 7,
      sprites: Sprites(
        other: OtherSprites(
          officialArtwork: OfficialArtwork(imageUrl: 'https://img.pokemon/1.png'),
        ),
      ),
      types: <TypeSlot>[
        TypeSlot(slot: 1, type: TypeInfo(name: 'grass')),
        TypeSlot(slot: 2, type: TypeInfo(name: 'poison')),
      ],
      abilities: <AbilitySlot>[
        AbilitySlot(ability: AbilityInfo(name: 'overgrow')),
        AbilitySlot(ability: AbilityInfo(name: 'chlorophyll')),
      ],
    );

    const PokemonSpeciesModel tSpecies = PokemonSpeciesModel(
      flavorTextEntries: <FlavorTextEntry>[
        FlavorTextEntry(
          flavorText: 'A strange seed\nwas planted.',
          language: Language(name: 'en'),
        ),
        FlavorTextEntry(
          flavorText: 'Una semilla rara\ffue plantada.',
          language: Language(name: 'es'),
        ),
      ],
      genera: <Genus>[
        Genus(genus: 'Seed Pokémon', language: Language(name: 'en')),
        Genus(genus: 'Pokémon Semilla', language: Language(name: 'es')),
      ],
      genderRate: 1,
    );

    test('toEntity should map basic fields correctly', () {
      PokedexDetail entity = tModel.toEntity(tSpecies);

      expect(entity.id, 1);
      expect(entity.name, 'bulbasaur');
      expect(entity.imageUrl, 'https://img.pokemon/1.png');
      expect(entity.types, <String>['grass', 'poison']);
      expect(entity.ability, 'overgrow');
    });

    test('toEntity should convert weight and height dividing by 10', () {
      PokedexDetail entity = tModel.toEntity(tSpecies);

      expect(entity.weight, 6.9);
      expect(entity.height, 0.7);
    });

    test('toEntity should prefer Spanish description and strip newlines', () {
      PokedexDetail entity = tModel.toEntity(tSpecies);

      expect(entity.description, 'Una semilla rara fue plantada.');
    });

    test('toEntity should prefer Spanish category', () {
      PokedexDetail entity = tModel.toEntity(tSpecies);

      expect(entity.category, 'Pokémon Semilla');
    });

    test('toEntity should fall back to first entry when no Spanish text', () {
      const PokemonSpeciesModel englishOnly = PokemonSpeciesModel(
        flavorTextEntries: <FlavorTextEntry>[
          FlavorTextEntry(
            flavorText: 'A strange seed.',
            language: Language(name: 'en'),
          ),
        ],
        genera: <Genus>[
          Genus(genus: 'Seed Pokémon', language: Language(name: 'en')),
        ],
        genderRate: 1,
      );

      PokedexDetail entity = tModel.toEntity(englishOnly);

      expect(entity.description, 'A strange seed.');
      expect(entity.category, 'Seed Pokémon');
    });

    group('gender calculation', () {
      test('genderRate 1 should produce 87.5% male, 12.5% female', () {
        PokedexDetail entity = tModel.toEntity(tSpecies);

        expect(entity.malePercentage, 87.5);
        expect(entity.femalePercentage, 12.5);
      });

      test('genderRate 4 should produce 50% male, 50% female', () {
        const PokemonSpeciesModel species = PokemonSpeciesModel(
          flavorTextEntries: <FlavorTextEntry>[
            FlavorTextEntry(
              flavorText: 'Desc',
              language: Language(name: 'es'),
            ),
          ],
          genera: <Genus>[
            Genus(genus: 'Cat', language: Language(name: 'es')),
          ],
          genderRate: 4,
        );

        PokedexDetail entity = tModel.toEntity(species);

        expect(entity.malePercentage, 50.0);
        expect(entity.femalePercentage, 50.0);
      });

      test('genderRate -1 (genderless) should produce 0% for both', () {
        const PokemonSpeciesModel species = PokemonSpeciesModel(
          flavorTextEntries: <FlavorTextEntry>[
            FlavorTextEntry(
              flavorText: 'Desc',
              language: Language(name: 'es'),
            ),
          ],
          genera: <Genus>[
            Genus(genus: 'Cat', language: Language(name: 'es')),
          ],
          genderRate: -1,
        );

        PokedexDetail entity = tModel.toEntity(species);

        expect(entity.malePercentage, 0);
        expect(entity.femalePercentage, 0);
      });

      test('genderRate 8 should produce 0% male, 100% female', () {
        const PokemonSpeciesModel species = PokemonSpeciesModel(
          flavorTextEntries: <FlavorTextEntry>[
            FlavorTextEntry(
              flavorText: 'Desc',
              language: Language(name: 'es'),
            ),
          ],
          genera: <Genus>[
            Genus(genus: 'Cat', language: Language(name: 'es')),
          ],
          genderRate: 8,
        );

        PokedexDetail entity = tModel.toEntity(species);

        expect(entity.malePercentage, 0);
        expect(entity.femalePercentage, 100.0);
      });
    });

    group('weaknesses calculation', () {
      test('grass type should have fire, ice, poison, flying, bug weaknesses',
          () {
        const PokedexDetailModel grassOnly = PokedexDetailModel(
          id: 1,
          name: 'test',
          weight: 10,
          height: 10,
          sprites: Sprites(
            other: OtherSprites(
              officialArtwork: OfficialArtwork(imageUrl: 'img'),
            ),
          ),
          types: <TypeSlot>[TypeSlot(slot: 1, type: TypeInfo(name: 'grass'))],
          abilities: <AbilitySlot>[
            AbilitySlot(ability: AbilityInfo(name: 'a')),
          ],
        );

        PokedexDetail entity = grassOnly.toEntity(tSpecies);

        expect(
          entity.weaknesses,
          unorderedEquals(<String>['fire', 'ice', 'poison', 'flying', 'bug']),
        );
      });

      test('combined types should merge weaknesses without duplicates', () {
        // grass + water → grass weaknesses + water weaknesses, deduplicated
        const PokedexDetailModel grassWater = PokedexDetailModel(
          id: 1,
          name: 'test',
          weight: 10,
          height: 10,
          sprites: Sprites(
            other: OtherSprites(
              officialArtwork: OfficialArtwork(imageUrl: 'img'),
            ),
          ),
          types: <TypeSlot>[
            TypeSlot(slot: 1, type: TypeInfo(name: 'grass')),
            TypeSlot(slot: 2, type: TypeInfo(name: 'water')),
          ],
          abilities: <AbilitySlot>[
            AbilitySlot(ability: AbilityInfo(name: 'a')),
          ],
        );

        PokedexDetail entity = grassWater.toEntity(tSpecies);

        // grass weaknesses: fire, ice, poison, flying, bug
        // water weaknesses: electric, grass
        // merged and deduplicated
        expect(
          entity.weaknesses,
          unorderedEquals(<String>[
            'fire',
            'ice',
            'poison',
            'flying',
            'bug',
            'electric',
            'grass',
          ]),
        );
      });

      test('unknown type should return empty weaknesses', () {
        const PokedexDetailModel unknownType = PokedexDetailModel(
          id: 1,
          name: 'test',
          weight: 10,
          height: 10,
          sprites: Sprites(
            other: OtherSprites(
              officialArtwork: OfficialArtwork(imageUrl: 'img'),
            ),
          ),
          types: <TypeSlot>[
            TypeSlot(slot: 1, type: TypeInfo(name: 'fairy')),
          ],
          abilities: <AbilitySlot>[
            AbilitySlot(ability: AbilityInfo(name: 'a')),
          ],
        );

        PokedexDetail entity = unknownType.toEntity(tSpecies);

        expect(entity.weaknesses, isEmpty);
      });
    });
  });
}
