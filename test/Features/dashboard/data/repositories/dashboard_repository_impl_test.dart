import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/pokedex_detail_model.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/pokemon_list_response.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/pokemon_model.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/pokemon_small_detail_model.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/models/pokemon_species_model.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/entities/pokedex_detail.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/entities/pokemon.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/entities/pokemon_small_detail.dart';
import 'package:mocktail/mocktail.dart';

class MockDashboardRemoteDatasource extends Mock
    implements DashboardRemoteDatasource {}

void main() {
  late MockDashboardRemoteDatasource mockDatasource;
  late DashboardRepositoryImpl repository;

  setUp(() {
    mockDatasource = MockDashboardRemoteDatasource();
    repository = DashboardRepositoryImpl(mockDatasource);
  });

  group('DashboardRepositoryImpl', () {
    group('fetchPokemons', () {
      List<PokemonModel> tPokemonModelList = <PokemonModel>[
        const PokemonModel(
          name: 'bulbasaur',
          url: 'https://pokeapi.co/api/v2/pokemon/1/',
        ),
      ];
      PokemonListResponse tPokemonListResponse = PokemonListResponse(
        count: 1,
        next: null,
        previous: null,
        results: tPokemonModelList,
      );

      test(
        '''should return a list of Pokemon when call to remote datasource is successful''',
        () async {
          // Arrange
          when(
            () => mockDatasource.fetchPokemons(),
          ).thenAnswer((_) async => tPokemonListResponse);

          // Act
          List<Pokemon> result = await repository.fetchPokemons();

          // Assert
          expect(result, isA<List<Pokemon>>());
          expect(result.first.name, 'bulbasaur');
          expect(result.first.id, 1);
          verify(() => mockDatasource.fetchPokemons()).called(1);
        },
      );

      test(
        'should propagate exceptions when call to remote datasource fails',
        () async {
          // Arrange
          when(
            () => mockDatasource.fetchPokemons(),
          ).thenAnswer((_) async => throw Exception('Fetch failed'));

          // Act & Assert
          expect(() => repository.fetchPokemons(), throwsException);
          verify(() => mockDatasource.fetchPokemons()).called(1);
        },
      );
    });

    group('fetchPokemonSmallDetail', () {
      const int tId = 1;
      const PokemonSmallDetailModel tPokemonSmallDetailModel =
          PokemonSmallDetailModel(
            id: tId,
            name: 'bulbasaur',
            types: <TypeSlotModel>[
              TypeSlotModel(type: TypeModel(name: 'grass')),
            ],
          );

      test(
        '''should return PokemonSmallDetail when call to remote datasource is successful''',
        () async {
          // Arrange
          when(
            () => mockDatasource.fetchPokemonSmallDetail(any()),
          ).thenAnswer((_) async => tPokemonSmallDetailModel);

          // Act
          PokemonSmallDetail result = await repository.fetchPokemonSmallDetail(
            tId,
          );

          // Assert
          expect(result, isA<PokemonSmallDetail>());
          expect(result.name, 'bulbasaur');
          expect(result.types.first, 'grass');
          verify(() => mockDatasource.fetchPokemonSmallDetail(tId)).called(1);
        },
      );

      test(
        'should propagate exceptions when call to remote datasource fails',
        () async {
          // Arrange
          when(
            () => mockDatasource.fetchPokemonSmallDetail(any()),
          ).thenAnswer((_) async => throw Exception('Error'));

          // Act & Assert
          expect(
            () => repository.fetchPokemonSmallDetail(tId),
            throwsException,
          );
          verify(() => mockDatasource.fetchPokemonSmallDetail(tId)).called(1);
        },
      );
    });

    group('fetchPokedexDetail', () {
      const int tId = 1;
      const PokedexDetailModel tPokedexDetailModel = PokedexDetailModel(
        id: tId,
        name: 'bulbasaur',
        weight: 69,
        height: 7,
        sprites: Sprites(
          other: OtherSprites(
            officialArtwork: OfficialArtwork(imageUrl: 'my_img_url'),
          ),
        ),
        types: <TypeSlot>[TypeSlot(slot: 1, type: TypeInfo(name: 'grass'))],
        abilities: <AbilitySlot>[
          AbilitySlot(ability: AbilityInfo(name: 'overgrow')),
        ],
      );

      const PokemonSpeciesModel tPokemonSpeciesModel = PokemonSpeciesModel(
        flavorTextEntries: <FlavorTextEntry>[
          FlavorTextEntry(
            flavorText: 'A strange seed...',
            language: Language(name: 'es'),
          ),
        ],
        genera: <Genus>[
          Genus(
            genus: 'Seed',
            language: Language(name: 'es'),
          ),
        ],
        genderRate: 1,
      );

      test(
        'should return PokedexDetail combining data from detail and species',
        () async {
          // Arrange
          when(
            () => mockDatasource.fetchPokedexDetail(any()),
          ).thenAnswer((_) async => tPokedexDetailModel);
          when(
            () => mockDatasource.fetchPokemonSpecies(any()),
          ).thenAnswer((_) async => tPokemonSpeciesModel);

          // Act
          PokedexDetail result = await repository.fetchPokedexDetail(tId);

          // Assert
          expect(result, isA<PokedexDetail>());
          expect(result.name, 'bulbasaur');
          expect(result.weight, 6.9);
          expect(result.height, 0.7);
          expect(result.description, 'A strange seed...');
          expect(result.category, 'Seed');
          expect(
            result.weaknesses,
            containsAll(<dynamic>['fire', 'ice', 'poison', 'flying', 'bug']),
          ); // weak against grass
          verify(() => mockDatasource.fetchPokedexDetail(tId)).called(1);
          verify(() => mockDatasource.fetchPokemonSpecies(tId)).called(1);
        },
      );

      test(
        'should propagate exceptions when fetchPokedexDetail fails',
        () async {
          // Arrange
          when(
            () => mockDatasource.fetchPokedexDetail(any()),
          ).thenAnswer((_) async => throw Exception('Fail'));
          // We shouldn't even reach species request in a well-written failure

          // Act & Assert
          expect(() => repository.fetchPokedexDetail(tId), throwsException);
          verify(() => mockDatasource.fetchPokedexDetail(tId)).called(1);
          verifyNever(() => mockDatasource.fetchPokemonSpecies(tId));
        },
      );

      test(
        'should propagate exceptions when fetchPokemonSpecies fails',
        () async {
          // Arrange
          when(
            () => mockDatasource.fetchPokedexDetail(any()),
          ).thenAnswer((_) async => tPokedexDetailModel);
          when(
            () => mockDatasource.fetchPokemonSpecies(any()),
          ).thenAnswer((_) async => throw Exception('Fail'));

          // Act & Assert
          await expectLater(
            () => repository.fetchPokedexDetail(tId),
            throwsException,
          );
          verify(() => mockDatasource.fetchPokedexDetail(tId)).called(1);
          verify(() => mockDatasource.fetchPokemonSpecies(tId)).called(1);
        },
      );
    });
  });
}
