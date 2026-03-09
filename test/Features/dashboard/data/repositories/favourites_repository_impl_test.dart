import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/datasources/favourites_local_datasource.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/repositories/favourites_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockFavouritesLocalDatasource extends Mock
    implements FavouritesLocalDatasource {}

void main() {
  late MockFavouritesLocalDatasource mockDatasource;
  late FavouritesRepositoryImpl repository;

  setUp(() {
    mockDatasource = MockFavouritesLocalDatasource();
    repository = FavouritesRepositoryImpl(mockDatasource);
  });

  group('FavouritesRepositoryImpl', () {
    group('getFavorites', () {
      test('should return a set of int from the datasource', () async {
        // Arrange
        Set<int> tFavorites = <int>{1, 2, 3};
        when(
          () => mockDatasource.getFavorites(),
        ).thenAnswer((_) async => tFavorites);

        // Act
        Set<int> result = await repository.getFavorites();

        // Assert
        expect(result, equals(tFavorites));
        verify(() => mockDatasource.getFavorites()).called(1);
        verifyNoMoreInteractions(mockDatasource);
      });

      test('should propagate exceptions thrown by the datasource', () async {
        // Arrange
        when(
          () => mockDatasource.getFavorites(),
        ).thenAnswer((_) async => throw Exception('Read error'));

        // Act & Assert
        expect(() => repository.getFavorites(), throwsException);
        verify(() => mockDatasource.getFavorites()).called(1);
      });
    });

    group('saveFavorites', () {
      test('should call saveFavorites on the datasource', () async {
        // Arrange
        Set<int> tFavorites = <int>{4, 5};
        when(
          () => mockDatasource.saveFavorites(any()),
        ).thenAnswer((_) async {});

        // Act
        await repository.saveFavorites(tFavorites);

        // Assert
        verify(() => mockDatasource.saveFavorites(tFavorites)).called(1);
        verifyNoMoreInteractions(mockDatasource);
      });

      test('should propagate exceptions thrown by the datasource', () async {
        // Arrange
        Set<int> tFavorites = <int>{4, 5};
        when(
          () => mockDatasource.saveFavorites(any()),
        ).thenAnswer((_) async => throw Exception('Write error'));

        // Act & Assert
        expect(() => repository.saveFavorites(tFavorites), throwsException);
        verify(() => mockDatasource.saveFavorites(tFavorites)).called(1);
      });
    });
  });
}
