import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/entities/pokemon.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/usecases/fetch_pokemons_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockDashboardRepository extends Mock implements DashboardRepository {}

void main() {
  late MockDashboardRepository mockRepository;
  late FetchPokemonsUseCase useCase;

  setUp(() {
    mockRepository = MockDashboardRepository();
    useCase = FetchPokemonsUseCase(mockRepository);
  });

  group('FetchPokemonsUseCase', () {
    List<Pokemon> tPokemons = <Pokemon>[
      Pokemon(id: 1, name: 'Bulbasaur', imageUrl: 'img'),
    ];

    test(
      '''should call fetchPokemons on the repository and return the correct result''',
      () async {
        // Arrange
        when(
          () => mockRepository.fetchPokemons(),
        ).thenAnswer((_) async => tPokemons);

        // Act
        List<Pokemon> result = await useCase();

        // Assert
        expect(result, tPokemons);
        verify(() => mockRepository.fetchPokemons()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should propagate exceptions thrown by the repository', () async {
      // Arrange
      Exception exception = Exception('Failed to fetch data');
      when(
        () => mockRepository.fetchPokemons(),
      ).thenAnswer((_) async => throw exception);

      // Act & Assert
      expect(() => useCase(), throwsA(exception));
      verify(() => mockRepository.fetchPokemons()).called(1);
    });
  });
}
