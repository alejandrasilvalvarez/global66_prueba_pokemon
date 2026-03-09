import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/dashboard/di/dashboards_providers.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/entities/pokemon.dart';
import 'package:global66_prueba_pokemon/features/dashboard/domain/usecases/fetch_pokemons_use_case.dart';
import 'package:global66_prueba_pokemon/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:global66_prueba_pokemon/features/dashboard/presentation/viewmodel/dashboard_viewmodel.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/src/framework.dart';

class MockFetchPokemonsUseCase extends Mock implements FetchPokemonsUseCase {}

void main() {
  late MockFetchPokemonsUseCase mockUseCase;
  late ProviderContainer container;

  setUp(() {
    mockUseCase = MockFetchPokemonsUseCase();
    container = ProviderContainer(
      overrides: <Override>[
        fetchPokemonsUseCaseProvider.overrideWithValue(mockUseCase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('DashboardViewModel', () {
    test('initial state is loading and then fetches data successfully', () async {
      List<Pokemon> pokemons = <Pokemon>[
        Pokemon(name: 'Bulbasaur', id: 1, imageUrl: 'img1'),
      ];
      when(() => mockUseCase.call()).thenAnswer((_) async => pokemons);

      container.read(dashboardViewModelProvider.notifier);

      // Right after read, the build completes returning loading (synchronously)
      expect(
        container.read(dashboardViewModelProvider),
        const DashboardState.loading(),
      );

      // Wait for the async loadPokemons microtask to finish
      await Future<void>.delayed(Duration.zero);

      expect(
        container.read(dashboardViewModelProvider),
        DashboardState.data(pokemons),
      );
      verify(() => mockUseCase.call()).called(1);
    });

    test('state becomes error if usecase throws an exception', () async {
      when(
        () => mockUseCase.call(),
      ).thenAnswer((_) async => throw Exception('Error Fetching Data'));

      container.read(dashboardViewModelProvider.notifier);

      expect(
        container.read(dashboardViewModelProvider),
        const DashboardState.loading(),
      );

      // Wait for catch block to execute
      await Future<void>.delayed(Duration.zero);

      container
          .read(dashboardViewModelProvider)
          // verify it's an error and contains our exception message string
          .maybeWhen(
            error: (String message) =>
                expect(message, contains('Error Fetching Data')),
            orElse: () => fail('State should be error'),
          );

      verify(() => mockUseCase.call()).called(1);
    });
  });
}
