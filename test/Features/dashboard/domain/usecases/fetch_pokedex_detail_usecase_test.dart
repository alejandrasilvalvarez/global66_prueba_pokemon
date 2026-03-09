import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/entities/pokedex_detail.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/usecases/fetch_pokedex_detail_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockDashboardRepository extends Mock implements DashboardRepository {}

void main() {
  late MockDashboardRepository mockRepository;
  late FetchPokedexDetailUseCase useCase;

  setUp(() {
    mockRepository = MockDashboardRepository();
    useCase = FetchPokedexDetailUseCase(mockRepository);
  });

  group('FetchPokedexDetailUseCase', () {
    const int tId = 1;
    PokedexDetail tPokedexDetail = PokedexDetail(
      id: 1,
      name: 'bulbasaur',
      imageUrl: 'img',
      types: const <String>['grass', 'poison'],
      weight: 6.9,
      height: 0.7,
      description: 'A strange seed was planted on its back at birth.',
      category: 'Seed',
      ability: 'Overgrow',
      weaknesses: const <String>['fire', 'psychic', 'flying', 'ice'],
      malePercentage: 87.5,
      femalePercentage: 12.5,
    );

    test(
      '''should call fetchPokedexDetail on the repository and return the correct result''',
      () async {
        // Arrange
        when(
          () => mockRepository.fetchPokedexDetail(any()),
        ).thenAnswer((_) async => tPokedexDetail);

        // Act
        PokedexDetail result = await useCase(tId);

        // Assert
        expect(result, tPokedexDetail);
        verify(() => mockRepository.fetchPokedexDetail(tId)).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should propagate exceptions thrown by the repository', () async {
      // Arrange
      Exception exception = Exception('Failed to fetch detail');
      when(
        () => mockRepository.fetchPokedexDetail(any()),
      ).thenAnswer((_) async => throw exception);

      // Act & Assert
      expect(() => useCase(tId), throwsA(exception));
      verify(() => mockRepository.fetchPokedexDetail(tId)).called(1);
    });
  });
}
