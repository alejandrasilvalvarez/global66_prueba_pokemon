import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/dashboard/data/repositories/favourites_repository_impl.dart';
import 'package:global66_prueba_pokemon/features/dashboard/di/favourites_providers.dart';
import 'package:global66_prueba_pokemon/features/dashboard/presentation/viewmodel/favourites_viewmodel.dart';
import 'package:mocktail/mocktail.dart';

class MockFavouritesRepositoryImpl extends Mock
    implements FavouritesRepositoryImpl {}

void main() {
  late MockFavouritesRepositoryImpl mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockFavouritesRepositoryImpl();
    container = ProviderContainer(
      overrides: [
        favouritesRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('FavoritesViewModel', () {
    test('initial state starts empty and then loads favorites', () async {
      when(
        () => mockRepository.getFavorites(),
      ).thenAnswer((_) async => <int>{1, 2});

      container.read(favouritesProvider.notifier);

      expect(container.read(favouritesProvider), <int>{});

      await Future<void>.delayed(Duration.zero);

      expect(container.read(favouritesProvider), <int>{1, 2});
      verify(() => mockRepository.getFavorites()).called(1);
    });

    test('toggleFavorite adds an id if not present', () async {
      when(
        () => mockRepository.getFavorites(),
      ).thenAnswer((_) async => <int>{});
      when(() => mockRepository.saveFavorites(any())).thenAnswer((_) async {});

      FavoritesViewModel viewModel = container.read(
        favouritesProvider.notifier,
      );
      await Future<void>.delayed(Duration.zero); // Let loadFavorites complete

      await viewModel.toggleFavorite(1);

      expect(container.read(favouritesProvider), <int>{1});
      verify(() => mockRepository.saveFavorites(<int>{1})).called(1);
    });

    test('toggleFavorite removes an id if already present', () async {
      when(
        () => mockRepository.getFavorites(),
      ).thenAnswer((_) async => <int>{1});
      when(() => mockRepository.saveFavorites(any())).thenAnswer((_) async {});

      FavoritesViewModel viewModel = container.read(
        favouritesProvider.notifier,
      );
      await Future<void>.delayed(Duration.zero); // Let loadFavorites complete

      await viewModel.toggleFavorite(1);

      expect(container.read(favouritesProvider), <int>{});
      verify(() => mockRepository.saveFavorites(<int>{})).called(1);
    });
  });
}
